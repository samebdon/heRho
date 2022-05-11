"""heRho_pairwise_variant_tally

Usage: 
 heRho_tally_pairwise_counts_vcf.py -v <FILE> [-h -b <FILE> -d <INT> -t <INT> -s <STR> -c <STR> -f <STR>]

Options:
 -v, --vcf <FILE>                       VCF file
 -b, --bed <FILE>                       Bed file (Optional, Default: Whole chromosomes)
 -d, --distance <INT>                   Max pairwise distance (Default: 1000)
 -t, --threads <INT>                    Thread limit (parallelised per chromosome, Default: 1)
 -s, --samples <STR>                    Comma separated list of samples to analyse (Default: all samples)
 -c, --chromosomes <STR>                Comma separated list of chromosomes to analyse (Default: All chromosomes)
 -f, --file_prefix <STR>                Optional file prefix

"""

# Example Command
# python heRho_tally_pairwise_counts_vcf.py -v vcf_file.vcf.gz -b bed_file.bed -d 1000 -t 1 -s sample_1,sample2 -c chrom_1,chrom_2

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

# To do
# Provided sample/chromosome list tests
# Figure out loading information with multiprocessing
# Check for intron overlaps
# Add omit contigs by default
# if d relative to chr length is large should do correction


class GenomeObj(object):
    def __init__(
        self,
        vcf_f=None,
        bed_f=None,
        sample_names=None,
        all_bed_intervals=None,
        chromosome_names=None,
        chrom_obj_dict={},
        genome_df=None,
        pooled_genome_df=None,
    ):
        self.vcf_f = vcf_f
        self.bed_f = bed_f
        self.sample_names = sample_names
        self.all_bed_intervals = all_bed_intervals
        self.chromosome_names = chromosome_names
        self.chrom_obj_dict = chrom_obj_dict
        self.genome_df = genome_df
        self.pooled_genome_df = pooled_genome_df

    def load_bed(self):
        print("Loading bed file...")
        self.all_bed_intervals = pybedtools.BedTool(self.bed_f)

    def initialise_chromosome_objs(self):
        print("Loading chromosomes from VCF file...")
        vcf_dict = allel.read_vcf(self.vcf_f, fields=["samples", "variants/CHROM"])
        # write test to check if each entry in chromosome_list is in variants/CHROM
        # could load sample and chromosome names in a different method to initialising chromosome objects
        if sample_list:
            self.sample_names = np.array(sample_list)
        else:
            self.sample_names = np.unique(vcf_dict["samples"])

        if chromosome_list:
            self.chromosome_names = np.array(chromosome_list)
        else:
            self.chromosome_names = np.unique(vcf_dict["variants/CHROM"])

        self.chrom_obj_dict = {}
        for chromosome in self.chromosome_names:
            self.chrom_obj_dict[chromosome] = ChromObj(
                chromosome_name=chromosome, vcf_f=self.vcf_f
            )

    def tally_chroms(self):
        print("Tallying chromosomes...")

        columns = [
            "sample_name",
            "interval_index",
            "interval_name",
            "chromosome",
            "distance",
            "H0",
            "H1",
            "H2",
            "theta",
        ]
        self.genome_df = pd.DataFrame(columns=columns).fillna(0)

        # loading bars and print statements within concurrent futures dont work properly
        replicates = self.chrom_obj_dict.keys()
        with concurrent.futures.ProcessPoolExecutor(max_workers=threads) as executor:
            results = executor.map(self.tally_chroms_worker, replicates)

        for chrom_df in results:
            self.genome_df = pd.concat([self.genome_df, chrom_df])

    def tally_chroms_worker(self, chromosome=None):
        print("Tallying chromosome '%s'..." % chromosome)
        self.chrom_obj_dict[chromosome].parse_vcf()
        if bed_f:
            self.chrom_obj_dict[chromosome].get_n_chr_bed_intervals(
                all_bed_intervals=self.all_bed_intervals
            )
            self.chrom_obj_dict[chromosome].sample_variant_bed_intersect(
                all_bed_intervals=self.all_bed_intervals
            )
        self.chrom_obj_dict[chromosome].sample_count_states(
            all_bed_intervals=self.all_bed_intervals,
            max_pair_distance=max_pair_distance,
        )
        chrom_df = self.chrom_obj_dict[chromosome].concat_df()
        print("Finished tallying '%s'." % chromosome)
        return chrom_df

    def pool_counts_within_chromosomes(self, max_pair_distance=1000):
        # would this be easier to do within chromosomes?

        print("Pooling intervals...")
        columns = [
            "sample_name",
            "chromosome",
            "distance",
            "H0",
            "H1",
            "H2",
            "theta",
        ]
        self.pooled_genome_df = pd.DataFrame(columns=columns).fillna(0)

        distance_list = list(range(1, max_pair_distance + 1))

        for sample in self.sample_names:
            for chromosome in self.chromosome_names:
                unpooled_df_subset = self.genome_df[
                    (self.genome_df["sample_name"] == sample)
                    & (self.genome_df["chromosome"] == chromosome)
                ]
                pooled_df_subset = pd.DataFrame(columns=columns).fillna(0)
                pooled_df_subset["sample_name"] = [sample] * max_pair_distance
                pooled_df_subset["chromosome"] = [chromosome] * max_pair_distance
                pooled_df_subset["distance"] = distance_list
                pooled_df_subset["H0"] = [
                    np.sum(
                        unpooled_df_subset[unpooled_df_subset["distance"] == d]["H0"]
                    )
                    for d in distance_list
                ]
                pooled_df_subset["H1"] = [
                    np.sum(
                        unpooled_df_subset[unpooled_df_subset["distance"] == d]["H1"]
                    )
                    for d in distance_list
                ]
                pooled_df_subset["H2"] = [
                    np.sum(
                        unpooled_df_subset[unpooled_df_subset["distance"] == d]["H2"]
                    )
                    for d in distance_list
                ]
                pooled_df_subset["theta"] = calculate_theta(
                    pooled_df_subset["H0"],
                    pooled_df_subset["H1"],
                    pooled_df_subset["H2"],
                )
                self.pooled_genome_df = pd.concat(
                    [self.pooled_genome_df, pooled_df_subset]
                )

    def write_tsvs(self):
        if bed_f:
            if prefix:
                output_file_unpooled = prefix + ".heRho_tally_per_interval.tsv"
                output_file_pooled = prefix + ".heRho_tally_per_chromosome.tsv"
            else:
                output_file_unpooled = "heRho_tally_per_interval.tsv"
                output_file_pooled = "heRho_tally_per_chromosome.tsv"
            self.genome_df.to_csv(output_file_unpooled, sep="\t", index=False)
            self.pooled_genome_df.to_csv(output_file_pooled, sep="\t", index=False)
            print(
                "Written output to '%s' and '%s'."
                % (output_file_unpooled, output_file_pooled)
            )

        else:
            if prefix:
                output_file_unpooled = prefix + ".heRho_tally_per_chromosome.tsv"
            else:
                output_file_unpooled = "heRho_tally_per_chromosome.tsv"

            self.genome_df.to_csv(
                output_file_unpooled,
                columns=[
                    "sample_name",
                    "chromosome",
                    "distance",
                    "H0",
                    "H1",
                    "H2",
                    "theta",
                ],
                sep="\t",
                index=False,
            )
            print("Written output to '%s'." % output_file_unpooled)


class ChromObj(object):
    def __init__(
        self,
        chromosome_name=None,
        vcf_f=None,  # can adjust to not store here
        n_intervals=None,
        read_groups=[],
        sample_obj_dict={},
        snps_in_bed_array=None,
        df_dict={},
    ):
        self.chromosome_name = chromosome_name
        self.vcf_f = vcf_f
        self.n_intervals = n_intervals
        self.read_groups = read_groups
        self.sample_obj_dict = sample_obj_dict
        self.snps_in_bed_array = snps_in_bed_array
        self.df_dict = df_dict

    def parse_vcf(self):
        if threads == 1:
            print("Parsing variants from VCF file...")
        query_fields = [
            "samples",
            "calldata/GT",
            "variants/CHROM",
            "variants/POS",
            "variants/NUMALT",
            "variants/is_snp",
        ]
        vcf_dict = allel.read_vcf(
            self.vcf_f, fields=query_fields, region=self.chromosome_name
        )
        # write test to check entries in sample list in vcf_dict["samples"]
        # move to genome class for loading
        if sample_list:
            read_groups = []
            for sample in sample_list:
                if sample not in vcf_dict["samples"]:
                    print("Sample %s not found in vcf file" % sample)
                else:
                    read_groups.append(sample)
            # test works and duplicate for chroms
            self.read_groups = np.array(read_groups)

        else:
            self.read_groups = vcf_dict["samples"]

        is_SNP_array = vcf_dict["variants/is_snp"]

        if isinstance(vcf_dict["variants/NUMALT"][0], int):
            numalt_array = vcf_dict["variants/NUMALT"]
            mask_array = (numalt_array == 1) & (is_SNP_array == True)
        else:
            print("NUMALT not in VCF file, assuming 1...")
            mask_array = is_SNP_array == True

        snp_gts = vcf_dict["calldata/GT"][mask_array]
        snp_pos = vcf_dict["variants/POS"][mask_array]
        last_snp = snp_pos[-1]
        snp_ga = allel.GenotypeArray(snp_gts)
        for sample_index, sample in enumerate(self.read_groups):
            self.sample_obj_dict[sample] = SampleObj(
                name=sample, snp_array=snp_pos[snp_ga.is_het()[:, sample_index]]
            )

    def get_n_chr_bed_intervals(self, all_bed_intervals=None):
        self.n_intervals = len(
            filter_bed_generator(
                bed_intervals=all_bed_intervals, chromosome_name=self.chromosome_name
            )
        )

    def sample_variant_bed_intersect(self, all_bed_intervals=None):
        sample_obj_dict = {}
        if threads == 1:
            print("Intersecting variants with bed per sample...")
        for sample in self.read_groups:
            chr_bed_intervals = filter_bed_generator(
                bed_intervals=all_bed_intervals, chromosome_name=self.chromosome_name
            )
            self.sample_obj_dict[sample].variant_bed_intersect(
                bed_intervals=chr_bed_intervals
            )

    def sample_count_states(self, all_bed_intervals=None, max_pair_distance=1000):

        self.df_dict = {}
        for sample in self.read_groups:
            if threads == 1:
                print("Tallying states in sample: %s" % sample)

            interval_dict = {}
            if bed_f:
                chr_bed_intervals = filter_bed_generator(
                    bed_intervals=all_bed_intervals,
                    chromosome_name=self.chromosome_name,
                )

                for interval_index, interval in enumerate(chr_bed_intervals):
                    if interval.end - interval.start < max_pair_distance:
                        continue
                    interval_dict[interval_index] = self.sample_obj_dict[
                        sample
                    ].count_states(
                        interval_index=interval_index,
                        interval=interval,
                        max_pair_distance=max_pair_distance,
                    )

            else:
                interval_dict[sample] = self.sample_obj_dict[sample].count_states(
                    max_pair_distance=max_pair_distance,
                    chromosome_name=self.chromosome_name,
                )

            self.df_dict[sample] = concat_dfs_from_dict(dictionary=interval_dict)

    def concat_df(self):

        if threads == 1:
            print("Concatenating dataframes...")
        columns = [
            "sample_name",
            "interval_index",
            "interval_name",
            "chromosome",
            "distance",
            "H0",
            "H1",
            "H2",
            "theta",
        ]
        all_sample_count_df = pd.DataFrame(columns=columns).fillna(0)
        for sample in self.read_groups:
            all_sample_count_df = pd.concat([all_sample_count_df, self.df_dict[sample]])

        return all_sample_count_df


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

        self.bed_variant_dict = {}
        # print("Sample: %s, Heterozygosity: %s" % (self.name, int(len(snp_array))/int(snp_array[-1])))
        for interval_index, interval in enumerate(bed_intervals):
            mask_array = (self.snp_array >= interval.start) & (
                self.snp_array < interval.end
            )
            interval_var_pos = self.snp_array[mask_array]
            self.bed_variant_dict[interval_index] = interval_var_pos

    def count_states(
        self,
        interval_index=None,
        interval=None,
        max_pair_distance=1000,
        chromosome_name=None,
    ):

        if interval:
            return state_counts(
                name=self.name,
                hzg_sites=self.bed_variant_dict[interval_index],
                interval_index=interval_index,
                interval_name=interval.name,
                interval_start=interval.start,
                interval_end=interval.end,
                chromosome=interval.chrom,
                max_pair_distance=max_pair_distance,
            )
        else:
            return state_counts(
                name=self.name,
                hzg_sites=self.snp_array,
                interval_end=self.snp_array[-1],
                chromosome=chromosome_name,
                max_pair_distance=max_pair_distance,
            )


def concat_dfs_from_dict(dictionary=None):
    columns = [
        "sample_name",
        "interval_index",
        "interval_name",
        "chromosome",
        "distance",
        "H0",
        "H1",
        "H2",
        "theta",
    ]
    concat_df = pd.DataFrame(columns=columns).fillna(0)
    for index in dictionary.keys():
        concat_df = pd.concat([concat_df, dictionary[index]])

    return concat_df


def state_counts(
    name=None,
    hzg_sites=None,
    interval_index=0,
    interval_name="all_variants",
    interval_end=None,
    interval_start=1,
    chromosome=None,
    max_pair_distance=1000,
):

    interval_length = interval_end - interval_start
    pairwise_distances = range(1, max_pair_distance + 1)
    max_comparisons = [interval_length - i for i in pairwise_distances]

    h_2_counts = [0] * max_pair_distance
    hzg_pairwise_dict = count_distance(pos=hzg_sites, max_distance=max_pair_distance)
    for key, value in hzg_pairwise_dict.items():
        h_2_counts[key - 1] = value

    # correction takes longer but theres a slight overestimate with no correction thats worth the more smaller intervals there are
    if bed_f:
        h_1_counts_uncorrected = [(2 * len(hzg_sites)) - (2 * i) for i in h_2_counts]
        correction = [
            len(
                list(
                    filter(
                        lambda x: x <= interval_start + i or x >= interval_end + 1 - i,
                        hzg_sites,
                    )
                )
            )
            for i in pairwise_distances
        ]
        h_1_counts = [
            h_1_counts_uncorrected[i - 1] - correction[i - 1]
            for i in pairwise_distances
        ]

    else:
        h_1_counts = [(2 * len(hzg_sites)) - (2 * i) for i in h_2_counts]

    h_0_counts = [
        max_comparisons[i - 1] - h_2_counts[i - 1] - h_1_counts[i - 1]
        for i in pairwise_distances
    ]

    columns = [
        "sample_name",
        "interval_index",
        "interval_name",
        "chromosome",
        "distance",
        "H0",
        "H1",
        "H2",
        "theta",
    ]
    state_count_df = pd.DataFrame(index=pairwise_distances, columns=columns).fillna(0)
    state_count_df["sample_name"] = [name] * max_pair_distance
    state_count_df["interval_index"] = [interval_index] * max_pair_distance
    state_count_df["interval_name"] = [interval_name] * max_pair_distance
    state_count_df["chromosome"] = [chromosome] * max_pair_distance
    state_count_df["distance"] = list(range(1, max_pair_distance + 1))
    state_count_df["H0"] = h_0_counts
    state_count_df["H1"] = h_1_counts
    state_count_df["H2"] = h_2_counts
    state_count_df["theta"] = calculate_theta(
        state_count_df["H0"], state_count_df["H1"], state_count_df["H2"]
    )
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


def filter_bed_generator(bed_intervals=None, chromosome_name=None):
    return bed_intervals.filter(lambda b: b.chrom == chromosome_name)


def calculate_theta(H0, H1, H2):
    total = H0 + H1 + H2
    return (H1 / total / 2) + (H2 / total)


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
    else:
        threads = 1

    if args["--samples"]:
        sample_list = str(args["--samples"]).replace(" ", "").split(",")
        print("Analysing samples: ", ", ".join(sample_list))
    else:
        print("Analysing all samples...")
        sample_list = None

    if args["--chromosomes"]:
        chromosome_list = str(args["--chromosomes"]).replace(" ", "").split(",")
        print("Analysing chromosomes: ", ", ".join(chromosome_list))
    else:
        print("Analysing all chromosomes...")
        chromosome_list = None

    if args["--file_prefix"]:
        prefix = str(args["--file_prefix"])
    else:
        prefix = None

    try:
        start_time = timer()

        data = GenomeObj(vcf_f=vcf_f, bed_f=bed_f)
        if bed_f:
            data.load_bed()
        else:
            print("No bed file specified analysing all variants...")
        data.initialise_chromosome_objs()
        data.tally_chroms()
        if bed_f:
            data.pool_counts_within_chromosomes(max_pair_distance=max_pair_distance)
        data.write_tsvs()

        print("[+] Total runtime: %.3fs" % (timer() - start_time))

    except KeyboardInterrupt:
        sys.stderr.write(
            "\n[X] Interrupted by user after %i seconds!\n" % (timer() - start_time)
        )
        sys.exit(-1)
