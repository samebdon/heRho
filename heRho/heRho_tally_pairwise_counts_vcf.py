"""heRho_tally_pairwise_counts_vcf

Usage: 
 heRho_tally_pairwise_counts_vcf.py -v <file> [-h -b <file> -d <int> -t <int> -s <str> -c <str> -f <str>]

Options:
 -v, --vcf <file>                       VCF file
 -b, --bed <file>                       Bed file (Optional)
 -d, --distance <int>                   Max pairwise distance (set to << chromosome length if not using bed files) [default: 1000]
 -t, --threads <int>                    Thread limit (parallelised per chromosome) [default: 1]
 -s, --samples <str>                    Comma separated subset of samples to analyse [default: all]
 -c, --chromosomes <str>                Comma separated subset of chromosomes to analyse [default: all]
 -f, --file_prefix <str>                Optional file prefix [default: output]

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
from timeit import default_timer as timer
from docopt import docopt
from collections import Counter

# change parallelisation to sample level rather than chromosome level?
# write unit tests
# write input format tests
# check samples and chromosomes in vcf
# check chromosomes in bed?

#could write an option to calcula

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
        max_pair_distance=None,
    ):
        self.vcf_f = vcf_f
        self.bed_f = bed_f
        self.sample_names = sample_names
        self.all_bed_intervals = all_bed_intervals
        self.chromosome_names = chromosome_names
        self.chrom_obj_dict = chrom_obj_dict
        self.genome_df = genome_df
        self.pooled_genome_df = pooled_genome_df
        self.max_pair_distance = max_pair_distance

    def load_bed(self):
        self.all_bed_intervals = pybedtools.BedTool(self.bed_f)

    def initialise_chromosome_objs(self):
        vcf_dict = allel.read_vcf(self.vcf_f, fields=["samples", "variants/CHROM"])
        if samples == 'all':
            self.sample_names = np.unique(vcf_dict["samples"])
        else:
            self.sample_names = np.array(samples.replace(" ", "").split(","))

        if chromosomes == 'all':
            self.chromosome_names = np.unique(vcf_dict["variants/CHROM"])
        else:
            self.chromosome_names = np.array(chromosomes.replace(" ", "").split(","))

        self.max_pair_distance = max_pair_distance

        self.chrom_obj_dict = {}
        for chromosome in self.chromosome_names:
            self.chrom_obj_dict[chromosome] = ChromObj(
                chromosome_name=chromosome, vcf_f=self.vcf_f
            )

    def tally_chroms(self):
        global threads

        columns = [
            "sample_name",
            "chromosome",
            "distance",
            "H0",
            "H1",
            "H2",
            "het",
        ]
        self.genome_df = pd.DataFrame(columns=columns).fillna(0)

        replicates = self.chrom_obj_dict.keys()
        with concurrent.futures.ProcessPoolExecutor(max_workers=threads) as executor:
            results = executor.map(self.tally_chroms_worker, replicates)
        for chrom_df in results:
            self.genome_df = pd.concat([self.genome_df, chrom_df])

    def tally_chroms_worker(self, chromosome=None):
        global max_pair_distance
        print("Tallying chromosome '%s'..." % chromosome)
        self.chrom_obj_dict[chromosome].parse_vcf(self.sample_names)
        if self.bed_f:
            self.chrom_obj_dict[chromosome].get_n_chr_bed_intervals(
                all_bed_intervals=self.all_bed_intervals
            )
            self.chrom_obj_dict[chromosome].sample_variant_bed_intersect(
                all_bed_intervals=self.all_bed_intervals
            )
        self.chrom_obj_dict[chromosome].sample_count_states(
            all_bed_intervals=self.all_bed_intervals,
            max_pair_distance=self.max_pair_distance,
        )

        columns = [
            "sample_name",
            "chromosome",
            "distance",
            "H0",
            "H1",
            "H2",
            "het",
        ]
        chrom_df = pd.DataFrame(columns=columns).fillna(0)
        for sample, sample_df in self.chrom_obj_dict[chromosome].df_dict.items():
            chrom_df = pd.concat([chrom_df, sample_df])
        print("Finished tallying '%s'." % chromosome)
        return chrom_df

    def write_tsvs(self):
        output_file = ".heRho_tally_per_chromosome.tsv"
        self.genome_df.to_csv(prefix+output_file, sep="\t", index=False)
        print(f"Written output to {prefix+output_file}.")


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

    def parse_vcf(self, sample_list):
        query_fields = [
            "samples",
            "calldata/GT",
            "variants/CHROM",
            "variants/POS",
        ]
        vcf_dict = allel.read_vcf(
            self.vcf_f, fields=query_fields, region=self.chromosome_name
        )

        # write test to check entries in sample list in vcf_dict["samples"]
        # move to genome class for loading
        # Should check chromosomes in vcf at some point

        self.read_groups = np.array(sample_list)

        snp_gts = vcf_dict["calldata/GT"]
        snp_pos = vcf_dict["variants/POS"]
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
            h0_count_arr = np.zeros(max_pair_distance)
            h1_count_arr = np.zeros(max_pair_distance)
            h2_count_arr = np.zeros(max_pair_distance)
            if self.n_intervals:
                chr_bed_intervals = filter_bed_generator(
                    bed_intervals=all_bed_intervals,
                    chromosome_name=self.chromosome_name,
                )

                for interval_index, interval in enumerate(chr_bed_intervals):
                    h0_count, h1_count, h2_count = self.sample_obj_dict[
                        sample
                    ].count_states(
                        interval_index=interval_index,
                        interval=interval,
                        max_pair_distance=max_pair_distance,
                    )

                    for arr, count in zip(
                        (h0_count_arr, h1_count_arr, h2_count_arr),
                        (h0_count, h1_count, h2_count),
                    ):
                        arr[:count.shape[0]] += count

            else:
                h0_count, h1_count, h2_count = self.sample_obj_dict[
                    sample
                ].count_states(
                    max_pair_distance=max_pair_distance,
                    chromosome_name=self.chromosome_name,
                )

                for arr, count in zip(
                    (h0_count_arr, h1_count_arr, h2_count_arr),
                    (h0_count, h1_count, h2_count),
                ):
                    arr[:count.shape[0]] += count

            self.df_dict[sample] = create_df(
                arrays=(h0_count_arr, h1_count_arr, h2_count_arr),
                name=sample,
                chromosome=self.chromosome_name,
            )


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
        print("Sample: %s, Heterozygosity: %s" % (self.name, int(len(self.snp_array))/int(self.snp_array[-1])))
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
                is_bed=True,
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
                is_bed=False,
                interval_end=self.snp_array[-1],
                chromosome=chromosome_name,
                max_pair_distance=max_pair_distance,
            )


def create_df(arrays, name, chromosome):
    h0, h1, h2 = arrays

    columns = [
        "sample_name",
        "chromosome",
        "distance",
        "H0",
        "H1",
        "H2",
        "het",
    ]

    max_distance = len(h0)

    sample_count_df = pd.DataFrame(columns=columns).fillna(0)
    sample_count_df["sample_name"] = [name] * max_distance
    sample_count_df["chromosome"] = [chromosome] * max_distance
    sample_count_df["distance"] = list(range(1, max_distance + 1))
    sample_count_df["H0"] = h0.astype(int)
    sample_count_df["H1"] = h1.astype(int)
    sample_count_df["H2"] = h2.astype(int)
    sample_count_df["het"] = calculate_het(
        sample_count_df["H0"], sample_count_df["H1"], sample_count_df["H2"]
    )
    return sample_count_df


def state_counts(
    name=None,
    hzg_sites=None,
    is_bed=False,
    interval_index=0,
    interval_name="all_variants",
    interval_end=None,
    interval_start=1,
    chromosome=None,
    max_pair_distance=1000,
):
    
    interval_length = interval_end - interval_start

    if interval_length < (max_pair_distance + 1):
        max_pair_distance = interval_length - 1

    pairwise_distances = range(1, max_pair_distance + 1)
    max_comparisons = [interval_length - i for i in pairwise_distances]

    h_2_counts = np.zeros(max_pair_distance)
    hzg_pairwise_dict = count_distance(pos=hzg_sites, max_distance=max_pair_distance)
    for key, value in hzg_pairwise_dict.items():
        h_2_counts[key - 1] = value

    h_1_counts_uncorrected = [(2 * len(hzg_sites)) - (2 * i) for i in h_2_counts]

    if max_pair_distance < 2500:
        correction = [
            (
                get_correction_count(
                    hzg_sites=hzg_sites,
                    interval_start=interval_start,
                    interval_end=interval_end,
                    distance=i,
                )
            )
            for i in pairwise_distances
        ]
    else:
        correction = np.array(
            [
                hzg_sites.shape[0]
                - np.searchsorted(hzg_sites, interval_end - i, side="left")
                + np.searchsorted(hzg_sites, interval_start + i, side="right")
                for i in pairwise_distances
            ]
        )

    h_1_counts = np.array(
        [h_1_counts_uncorrected[i - 1] - correction[i - 1] for i in pairwise_distances],
    )

    h_0_counts = np.array(
        [
            max_comparisons[i - 1] - h_2_counts[i - 1] - h_1_counts[i - 1]
            for i in pairwise_distances
        ],
    )

    return h_0_counts, h_1_counts, h_2_counts


def count_distance(pos, max_distance=1000):
    # thanks dom
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
            while len(pool):
                for product in itertools.product([pool.popleft()], pool):
                    counter[abs(product[1] - product[0])] += 1
    return counter


def filter_bed_generator(bed_intervals=None, chromosome_name=None):
    return bed_intervals.filter(lambda b: b.chrom == chromosome_name)


def calculate_het(H0, H1, H2):
    total = H0 + H1 + H2
    return (H1 / total / 2) + (H2 / total)


def get_correction_count(hzg_sites, interval_start, interval_end, distance):
    left_count = 0
    right_count = 0

    for site in hzg_sites:
        if site >= interval_start + distance:
            break
        left_count += 1

    for site in hzg_sites[::-1]:
        if site <= interval_end - distance:
            break
        right_count += 1

    return left_count + right_count


if __name__ == "__main__":
    args = docopt(__doc__)
    vcf_f = args["--vcf"]
    bed_f = args["--bed"]
    max_pair_distance = int(args["--distance"])
    threads = int(args["--threads"])
    samples = str(args["--samples"])
    chromosomes = str(args["--chromosomes"])
    prefix = str(args["--file_prefix"])

    try:
        start_time = timer()

        data = GenomeObj(vcf_f=vcf_f, bed_f=bed_f)
        if bed_f:
            data.load_bed()
        data.initialise_chromosome_objs()
        data.tally_chroms()
        data.write_tsvs()

        print("[+] Total runtime: %.3fs" % (timer() - start_time))

    except KeyboardInterrupt:
        sys.stderr.write(
            "\n[X] Interrupted by user after %i seconds!\n" % (timer() - start_time)
        )
        sys.exit(-1)
