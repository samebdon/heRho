#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""heRho_variant_simulator

Usage: 
 heRho_variant_simulator.py -c <INT> -r <FLOAT> -s <INT> -t <INT> [-h  -g <FLOAT> -L <INT>]

Options:
 -c, --chromosome_number <INT>          Chromosome number
 -r, --crossover_rate <Int>		Crossover rate
 -g, --gene_conversion_rate <FLOAT>     Gene conversion rate
 -L, --mean_tract_length <INT>			Mean gene conversion tract length
 -s, --sequence_length <INT>			Sequence length
 -t, --threads <INT>					Thread limit

"""

from docopt import docopt
import msprime
import tskit
import numpy as np
import csv
import concurrent.futures
import datetime
import os


def sim_replicates(seeds):

    ancestry_seed, mutation_seed = seeds

    if gene_conversion:
        ancestry_reps = msprime.sim_ancestry(
            samples=samples,
            recombination_rate=rbp,
            gene_conversion_rate=gbp,
            gene_conversion_tract_length=mean_tract_length,
            sequence_length=sequence_length,
            population_size=pop_size,
            num_replicates=num_replicates,
            random_seed=ancestry_seed,
        )
    else:
        ancestry_reps = msprime.sim_ancestry(
            samples=samples,
            recombination_rate=rbp,
            sequence_length=sequence_length,
            population_size=pop_size,
            num_replicates=num_replicates,
            random_seed=ancestry_seed,
        )

    for ts in ancestry_reps:
        mutated_ts = msprime.sim_mutations(ts, rate=mu, random_seed=mutation_seed)
        ### discrete_genome=False)

        print(
            "Replicate seed "
            + str(ancestry_seed)
            + "/"
            + str(mutation_seed)
            + " completed."
        )

        return mutated_ts


def sim_wrapper(seeds, threads):

    with concurrent.futures.ProcessPoolExecutor(max_workers=threads) as executor:
        results = executor.map(sim_replicates, seeds)
        S = np.array(list(results), dtype=object)

        for idx, replicate in enumerate(S):
            with open(
                path
                + "chromosome_"
                + str(chromosome_number)
                + ".replicate_"
                + str(idx)
                + ".vcf",
                "w",
            ) as vcf_f_h:
                replicate.write_vcf(vcf_f_h, contig_id=str(chromosome_number))


# global parameters
rng = np.random.RandomState()

num_replicates = 100
seeds = rng.randint(1, 2 ** 31, size=(num_replicates, 2))
theta = 0.0071
mu = 5.4e-9
ne = theta / (4 * mu)
pop_size = ne
samples = 10

args = docopt(__doc__)
chromosome_number = args["--chromosome_number"]

crossover_rate = args["--crossover_rate"]
rbp = float(crossover_rate) / (4 * ne)

if args["--gene_conversion_rate"]:
    gene_conversion = True
    gene_conversion_rate = args["--gene_conversion_rate"]
    mean_tract_length = args["--mean_tract_length"]
    gbp = float(gene_conversion_rate) / (4 * ne)
else:
    gene_conversion = False

sequence_length = args["--sequence_length"]
threads = int(args["--threads"])


path = os.path.join("./heRho_simulations/", "chromosome_" + chromosome_number + "/")
os.makedirs(path, exist_ok=True)

begin_time = datetime.datetime.now()
sim_wrapper(seeds=seeds, threads=threads)
print(datetime.datetime.now() - begin_time)
