#!/usr/bin/env python
# coding: utf-8

"""heRho_stand_alone

Usage: 
 heRho_stand_alone.py -i <FILE> [-h]

Options:
 -i, --input_file <FILE>                Tally of pairwise site configurations (.tsv)


"""

# Example Command
# python heRho_stand_alone.py -i example_data.tsv

import numpy as np
import nlopt
import pandas as pd
from math import log, exp
from docopt import docopt
from timeit import default_timer as timer
import sys


def combine_chr_across_individuals(thisDF):
    test = thisDF[['distance','H0','H1','H2','het']].copy()
    numSamples = len(thisDF['sample_name'].unique())
    test = test.groupby(['distance'],as_index=False).sum()
    test['het'] = test['het']/numSamples
    test = test.to_numpy()
    return(test)


def single_chr_obj_fun(x_, arr):
    rbp, g, L = x_
    test = np.apply_along_axis(lambda x: calc_single_dist(x, rbp, g, L), 1, arr)
    obfun = np.sum(test)

    return obfun


def calc_single_dist(x, rbp, g, L):
    d, h0, h1, h2, th = x

    r = rbp * (d + 2 * (g / rbp) * L * (1 - exp(-d / L)))

    calcH0 = (
        18
        + 13 * r
        + r ** 2
        + 36 * th
        + 22 * th ** 2
        + 4 * th ** 3
        + r * (6 * th + th ** 2)
    ) / (
        (1 + th)
        * (
            18
            + 13 * r
            + r ** 2
            + 54 * th
            + 40 * th ** 2
            + 8 * th ** 3
            + r * (r * th + 19 * th + 6 * th ** 2)
        )
    )
    calcH2 = (th ** 2 * (36 + 14 * r + r ** 2 + 36 * th + 6 * th * r + 8 * th ** 2)) / (
        (1 + th)
        * (
            18
            + 13 * r
            + r ** 2
            + 54 * th
            + 40 * th ** 2
            + 8 * th ** 3
            + r * (r * th + 19 * th + 6 * th ** 2)
        )
    )
    calcH1 = 1 - calcH0 - calcH2

    val = h0 * log(calcH0) + h1 * log(calcH1) + h2 * log(calcH2)
    return val


def across_chr_obj_fun(x, dfArrList):
    numChrs = len(dfArrList)
    rList = x[0:numChrs]
    gList = x[numChrs : numChrs + numChrs]
    L = x[-1]

    obFun = sum(
        [
            single_chr_obj_fun([rs, gs, L], arr)
            for (rs, gs, arr) in list(zip(rList, gList, dfArrList))
        ]
    )

    return obFun


def heRho_estimate_genome(pooledChrs):

    numberChromosomes = len(pooledChrs)

    lowerBounds = (
        [0.000001 for x in range(numberChromosomes)]
        + [0.000001 for x in range(numberChromosomes)]
        + [10]
    )
    upperBounds = (
        [0.5 for x in range(numberChromosomes)]
        + [0.5 for x in range(numberChromosomes)]
        + [5000]
    )
    startPoints = (
        [0.001 for x in range(numberChromosomes)]
        + [0.001 for x in range(numberChromosomes)]
        + [50]
    )

    opt = nlopt.opt(nlopt.LN_NELDERMEAD, numberChromosomes + numberChromosomes + 1)

    opt.set_lower_bounds(lowerBounds)
    opt.set_upper_bounds(upperBounds)

    opt.set_max_objective(lambda x, grad: across_chr_obj_fun(x, pooledChrs))

    res = opt.optimize(startPoints)
    return res


def heRho_format_and_print(coEstimates, chrNames):
    numChrs = len(chrNames)
    kappas = coEstimates[0:numChrs]
    gammas = coEstimates[numChrs : numChrs * 2]
    L = coEstimates[-1]
    print("Global estimate of tract length L = {}".format(L))
    print("chr\tkappa\tgamma")
    for name, kappa, gamma in list(zip(chrNames, kappas, gammas)):
        print("{}\t{}\t{}".format(name, kappa, gamma))


if __name__ == "__main__":

    args = docopt(__doc__)

    try:
        start_time = timer()
        fileIn = args["--input_file"]

        df = pd.read_csv(fileIn, delimiter="\t")
        df["sample_name"] = df["sample_name"].astype(str)
        df["chromosome"] = df["chromosome"].astype(str)

        chrNames = df["chromosome"].unique()
        numChrs = len(chrNames)

        pooledDataByChr = [
            combine_chr_across_individuals(df.loc[(df["chromosome"] == cName)])
            for cName in chrNames
        ]

        rhoCoEstimates = heRho_estimate_genome(pooledDataByChr)

        heRho_format_and_print(rhoCoEstimates, chrNames)

        print("[+] Total runtime: %.3fs" % (timer() - start_time))

        exit()

    except KeyboardInterrupt:
        sys.stderr.write(
            "\n[X] Interrupted by user after %i seconds!\n" % (timer() - start_time)
        )
        sys.exit(-1)
