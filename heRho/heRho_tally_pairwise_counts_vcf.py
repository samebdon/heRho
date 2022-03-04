"""heRho_pairwise_variant_tally
Function as is for talling output from heRHo_variant_simulator.py

Usage: 
 heRho_tally_pairwise_counts_vcf.py -v <FILE> [-h -b <FILE> -d <INT> -t <INT>]

Options:
 -v, --vcf <FILE>                       VCF file
 -b, --bed <FILE>                       Bed file
 -d, --distance <INT>                   Max pairwise distance (default 1000)
 -t, --threads <INT>                    Thread limit #### Not currently parallel

"""

import pandas as pd
import numpy as np
import itertools
import concurrent.futures
import collections
import sys, os
import pybedtools
import allel
from tqdm import tqdm
from timeit import default_timer as timer
from docopt import docopt
from collections import Counter

#
# CURRENTLY ASSUMES VCF AND BED OF ONE CHROMOSOME/CONTIG
#
# To do
# Need to account for chromosome, could make dict of var per chromosome (see allel chromposindex and locaterange)

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
        print("Parsing variants...")
        query_fields = [
            "samples",
            "calldata/GT",
            "variants/CHROM", 
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
        #snp_chrom = vcf_dict["variants/CHROM"][mask_array]
        #chrom_snp_idx = allel.ChromPosIndex(snp_chrom, snp_pos)
        #print(chrom_snp_idx.locate_key('iphiclides_podalirius.IP_504.chromosome_5'))
        last_snp = snp_pos[-1]
        snp_ga = allel.GenotypeArray(snp_gts)
        for sample_index, sample in enumerate(self.read_groups):
            self.sample_obj_dict[sample] = SampleObj(
                snp_array=snp_pos[snp_ga.is_het()[:, sample_index]]
            )

    def load_bed(self):
        # make sure bed regions are referring to vcf regions properly
        if bed_f:
            self.bed_intervals = pybedtools.BedTool(self.bed_f)

    def sample_variant_bed_intersect(self, bed_intervals=None):
        if bed_f:
            sample_obj_dict = {}
            print("Intersecting variants with bed per sample...")
            for sample in tqdm(self.read_groups, total=len(self.read_groups)):
                self.sample_obj_dict[sample].variant_bed_intersect(
                    bed_intervals=self.bed_intervals
                )

    def sample_count_states(self, max_pair_distance=1000):
        for sample in self.read_groups:
            print("Tallying states in sample: %s" % sample)
            if bed_f:
                for interval_index, interval in tqdm(
                    enumerate(self.bed_intervals), total=len(self.bed_intervals)
                ):
                    if interval.end - interval.start < max_pair_distance:
                        continue
                    self.sample_obj_dict[sample].count_states(
                        interval_index=interval_index,
                        interval=interval,
                        max_pair_distance=max_pair_distance,
                    )

            else:
                self.sample_obj_dict[sample].count_states(
                    max_pair_distance=max_pair_distance,
                    )

    def write_tsv(self):

        print("Writing tsv...")
        columns = [
            "interval_index",
            "name",
            "chromosome",
            "distance",
            "H0",
            "H1",
            "H2",
            "theta",
        ]
        all_sample_count_df = pd.DataFrame(columns=columns).fillna(0)
        for sample in tqdm(self.read_groups, total=len(self.read_groups)):
            sample_df = self.sample_obj_dict[sample].concat_dfs()
            df_length = sample_df.shape[0]
            sample_list = [sample] * df_length
            sample_df["sample"] = sample_list
            all_sample_count_df = pd.concat([all_sample_count_df, sample_df])

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
        if interval:
            self.state_count_df_dict[interval_index] = state_counts(
                hzg_sites=self.bed_variant_dict[interval_index],
                interval_index=interval_index,
                interval_name=interval.name,
                interval_length=interval.end,
                chromosome=interval.chrom,
                max_pair_distance=max_pair_distance,
            )
        else:
            self.state_count_df_dict[0] = state_counts(
                hzg_sites=self.snp_array,
                interval_length=self.snp_array[-1],
                max_pair_distance=max_pair_distance,
            )


    def concat_dfs(self):
        columns = [
            "interval_index",
            "name",
            "chromosome",
            "distance",
            "H0",
            "H1",
            "H2",
            "theta",
        ]
        concat_state_count_df = pd.DataFrame(columns=columns).fillna(0)
        for interval_index in self.state_count_df_dict.keys():
            concat_state_count_df = pd.concat(
                [concat_state_count_df, self.state_count_df_dict[interval_index]]
            )
        return concat_state_count_df


def state_counts(
    hzg_sites=None,
    interval_index=0,
    interval_name="all_variants",
    interval_length=None,
    chromosome="all_variants",
    max_pair_distance=1000,
):
    # Count h0, h1, and h2 given a window of known length and the positions of known variant sites
    # maybe should split this up into smaller functions
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
        len(list(filter(lambda x: x <= i or x >= interval_length + 1 - i, hzg_sites)))
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

    columns = [
        "interval_index",
        "name",
        "chromosome",
        "distance",
        "H0",
        "H1",
        "H2",
        "theta",
    ]
    state_count_df = pd.DataFrame(index=pairwise_distances, columns=columns).fillna(0)

    state_count_df["interval_index"] = [interval_index] * max_pair_distance
    state_count_df["name"] = [interval_name] * max_pair_distance
    state_count_df["chromosome"] = [chromosome] * max_pair_distance
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


if __name__ == "__main__":

    args = docopt(__doc__)

    vcf_f = args["--vcf"]

    if args["--bed"]:
        bed_f = args["--bed"]
    else:
        bed_f = None

    if args["--distance"]:
        max_pair_distance = int(args["--distance"])
    else:
        max_pair_distance = 1000

    if args["--threads"]:
        threads = int(args["--threads"])

    try:
        start_time = timer()
        data = DataObj(vcf_f=vcf_f, bed_f=bed_f)
        data.parse_vcf()
        data.load_bed()
        data.sample_variant_bed_intersect()
        data.sample_count_states(max_pair_distance=max_pair_distance)
        data.write_tsv()

        print("[+] Total runtime: %.3fs" % (timer() - start_time))

    except KeyboardInterrupt:
        sys.stderr.write(
            "\n[X] Interrupted by user after %i seconds!\n" % (timer() - start_time)
        )
        sys.exit(-1)
