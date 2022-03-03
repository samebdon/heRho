"""heRho_pairwise_variant_tally
Function as is for talling output from heRHo_variant_simulator.py

Usage: 
 heRho_pairwise_variant_tally.py -c <STR> -s <INT> -t <INT>

Options:
 -c, --chromosome_number <STR>          Chromosome number
 -s, --sequence_length <INT>            Sequence length
 -t, --threads <INT>                    Thread limit

"""

import pandas as pd
import numpy as np
import itertools
import datetime
import concurrent.futures
import collections
import os
import glob
import shutil
import pybedtools
import allel
from tqdm import tqdm
from docopt import docopt
from pathlib import Path
from collections import Counter


class DataObj(object):
    def __init__(
        self,
        vcf_f=None,
        bed_f=None,
        read_groups=[],
        sample_obj_dict={},
        bed_intervals=None,
        snps_in_bed_array=None,
    ):
        self.vcf_f = vcf_f
        self.bed_f = bed_f
        self.read_groups = read_groups
        self.sample_obj_dict = sample_obj_dict
        self.bed_intervals = bed_intervals
        self.snps_in_bed_array = snps_in_bed_array

    def parse_vcf(self):
        query_fields = [
            "samples",
            "calldata/GT",
            "variants/CHROM",  ### Might need to filter vcf by chrom, see if this lines up with BED
            "variants/POS",
            "variants/NUMALT",
            "variants/is_snp",
        ]
        vcf_dict = allel.read_vcf(self.vcf_f, fields=query_fields)
        self.read_groups = vcf_dict["samples"]
        numalt_array = vcf_dict["variants/NUMALT"]
        is_SNP_array = vcf_dict["variants/is_snp"]
        mask_array = (numalt_array == 1) & (is_SNP_array == True)
        snp_gts = vcf_dict["calldata/GT"][mask_array]
        snp_pos = vcf_dict["variants/POS"][mask_array]
        last_snp = snp_pos[-1]
        snp_ga = allel.GenotypeArray(snp_gts)
        for sample_index, sample in enumerate(self.read_groups):
            self.sample_obj_dict[sample] = SampleObj(
                snp_array=snp_pos[snp_ga.is_het()[:, sample_index]]
            )

    def load_bed(self):
        # could include a way to label bed regions, should track chromosome
        # make sure bed regions are referring to vcf regions properly
        self.bed_intervals = pybedtools.BedTool(self.bed_f)

    def sample_variant_bed_intersect(self, bed_intervals=None):
        sample_obj_dict = {}
        for sample in self.read_groups:
            self.sample_obj_dict[sample].variant_bed_intersect(self.bed_intervals)

    def sample_count_states(self, max_pair_distance=1000):
        for sample in self.read_groups:
            print("Now counting sample %s" % sample)
            for interval_index, interval in tqdm(enumerate(self.bed_intervals), total=len(self.bed_intervals)):
                if interval.end - interval.start < max_pair_distance:
                    continue
                self.sample_obj_dict[sample].count_states(
                    interval_index=interval_index,
                    interval=interval,
                    max_pair_distance=max_pair_distance,
                )

    def write_tsv(self):

        columns = ["interval", "distance", "H0", "H1", "H2", "theta", "sample"]
        all_sample_count_df = pd.DataFrame(columns=columns).fillna(0)
        for sample in self.read_groups:
            sample_df = self.sample_obj_dict[sample].concat_dfs()
            df_length = sample_df.shape[0]
            sample_list = [sample] * df_length
            sample_df["sample"] = sample_list
            all_sample_count_df = pd.merge(
                all_sample_count_df, self.state_count_df_dict[interval_index]
            )

            # sort out chromosome tracking

        all_sample_count_df.to_csv("heRho_tally.tsv", sep="\t", index=False)


class SampleObj(object):
    def __init__(
        self,
        name=None,
        snp_array=None,
        bed_variant_dict={},
        state_count_df_dict={},
    ):
        self.name = name
        self.snp_array = snp_array
        self.bed_variant_dict = bed_variant_dict
        self.state_count_df_dict = state_count_df_dict

    def variant_bed_intersect(self, bed_intervals=None):
        for interval_index, interval in enumerate(bed_intervals):
            mask_array = (self.snp_array >= interval.start) & (
                self.snp_array < interval.end
            )
            interval_var_pos = self.snp_array[mask_array]
            self.bed_variant_dict[interval_index] = interval_var_pos

    def count_states(self, interval_index=None, interval=None, max_pair_distance=1000):
        self.state_count_df_dict[interval_index] = state_counts(
            hzg_sites=self.bed_variant_dict[interval_index],
            interval_index=interval_index,
            interval_length=interval.end,
            max_pair_distance=max_pair_distance,
        )

    def concat_dfs(self):
        concat_state_count_df = self.state_count_df_dict[0]
        for interval_index in self.state_count_df_dict.keys():
            if interval_index == 0:
                continue
            concat_state_count_df = pd.concat(
                init_dict, self.state_count_df_dict[interval_index]
            )
        return concat_state_count_df


def state_counts(hzg_sites=None,interval_index=None, interval_length=None, max_pair_distance=1000):
    # Count h0, h1, and h2 given a window of known length and the positions of known variant sites
    #maybe should split this up into smaller functions
    pairwise_distances = range(1, max_pair_distance + 1)
    # maximum number of comparisons per pairwise distance
    last_positions = [interval_length - i for i in pairwise_distances]

    # state_counts
    h_2_counts = [0] * max_pair_distance
    hzg_pairwise_dict = count_distance(pos=hzg_sites, max_distance=max_pair_distance)
    for key, value in hzg_pairwise_dict.items():
        h_2_counts[key - 1] = value

    # h_1_counts uncorrected for end overlap
    h_1_counts_uncorrected = [(2 * len(hzg_sites)) - (2 * i) for i in h_2_counts]
    # calculate the number of out of bounds comparisons
    correction = [
        len(
            list(
                filter(lambda x: x <= i or x >= interval_length + 1 - i, hzg_sites)
            )
        )
        for i in pairwise_distances
    ]
    h_1_counts = [
        h_1_counts_uncorrected[i - 1] - correction[i - 1] for i in pairwise_distances
    ]

    # find h0 from remainder
    h_0_counts = [
        last_positions[i - 1] - h_2_counts[i - 1] - h_1_counts[i - 1]
        for i in pairwise_distances
    ]

    columns = ["interval", "distance", "H0", "H1", "H2", "theta"]
    state_count_df = pd.DataFrame(index=pairwise_distances, columns=columns).fillna(0)

    state_count_df["interval"] = [interval_index] * max_pair_distance
    # state_count_df["chromosome"] = [chrom] * max_pair_distance
    state_count_df["distance"] = list(range(1, max_pair_distance + 1))
    state_count_df["H0"] = h_0_counts
    state_count_df["H1"] = h_1_counts
    state_count_df["H2"] = h_2_counts

    total = last_positions
    H1_frac = state_count_df["H1"] / total
    H2_frac = state_count_df["H2"] / total

    state_count_df["theta"] = (H1_frac / 2) + H2_frac

    return state_count_df


def count_distance(pos, max_distance=1000):
    counter = collections.Counter()
    sites = np.array(pos)
    batches = np.split(sites, np.where(np.diff(sites) > max_distance + 1)[0] + 1)
    for batch in batches:
        if batch.shape[0] >= 2:
            queue = collections.deque(batch)
            pool = collections.deque([])
            while len(queue):
                try:
                    while not pool or abs(queue[0] - pool[0]) <= max_distance:
                        pool.append(queue.popleft())
                except IndexError:
                    pass
                for product in itertools.product([pool.popleft()], pool):
                    counter[abs(product[1] - product[0])] += 1
                    # counter[product] += 1
            while len(pool):
                for product in itertools.product([pool.popleft()], pool):
                    counter[abs(product[1] - product[0])] += 1
                    # counter[product] += 1
    return counter


vcf_f = "dev_data/iphiclides_podalirius.IP_504.chromosome_5.vcf.gz"
bed_f = "dev_data/iphiclides_podalirius.v2_0.chromosomes.callable.bed"
max_pair_distance = 2000
data = DataObj(vcf_f=vcf_f, bed_f=bed_f)
data.parse_vcf()
data.load_bed()
data.sample_variant_bed_intersect()
data.sample_count_states(max_pair_distance=max_pair_distance)
data.write_tsv()

# args = docopt(__doc__)
# chrom = args['--chromosome_number']
# window_length = int(args['--sequence_length'])
# threads = int(args['--threads'])

# begin_time = datetime.datetime.now()
# print(datetime.datetime.now()-begin_time)
