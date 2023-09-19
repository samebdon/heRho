heRho
=========
heterozygosity-based estimator of Rho

heRho estimates crossover rates, gene conversion rates, and the mean gene conversion tract length using distance-dependent heterozygosity data from single diploid genomes in a simple composite-likelihood scheme. heRho can be run either using variant data from real genomes or via simulations using [msprime](https://github.com/tskit-dev/msprime). More information about the method and implementation can be read at [Genetics](https://academic.oup.com/genetics/advance-article/doi/10.1093/genetics/iyac100/6623412).

## Dependencies (via [mamba](https://mamba.readthedocs.io/en/latest/))
-------
```
mamba create -n herho && \
mamba activate herho && \
mamba install pandas=2.0.3 numpy pybedtools tqdm docopt scikit-allel tabix nlopt matplotlib # math multiprocessing
```

# Workflow

## Preprocessing: tally pairwise variant configurations using variant data or simulations
-------
**A**. Variant data - '[heRho/heRho_tally_pairwise_counts_vcf.py](https://github.com/samebdon/heRho/blob/main/heRho/heRho_tally_pairwise_counts_vcf.py)'

Input: VCF file (SNPs only)  assuming one diploid per read group. Optional BED file delegating regions to tally.

Output: Data tsv compliant with parameter estimation scripts (example at heRho/example_data.tsv).

Usage:

```
heRho_tally_pairwise_counts_vcf

Usage: 
heRho_tally_pairwise_counts_vcf.py -v <FILE> [-h -b <FILE> -d <INT> -t <INT> -s <STR> -c <STR> -f <STR>]

Options:
 -v, --vcf <FILE>                       VCF file (SNPs only)
 -b, --bed <FILE>                       Bed file (Optional, Default: Whole chromosomes)
 -d, --distance <INT>                   Max pairwise distance (set to << chromosome length if not using bed files, Default: 1000)
 -t, --threads <INT>                    Thread limit (parallelised per chromosome, Default: 1)
 -s, --samples <STR>                    Comma separated list of samples to analyse (Default: all samples)
 -c, --chromosomes <STR>                Comma separated list of chromosomes to analyse (Default: all chromosomes)
 -f, --file_prefix <STR>                Optional file prefix

Example command:
python heRho_tally_pairwise_counts_vcf.py -v vcf_file.vcf.gz -b bed_file.bed -d 1000 -t 1 -s sample_1,sample2 -c chrom_1,chrom_2 -f tally_1
```

**B**. Simulations - '[heRho/heRho_variant_simulator.py](https://github.com/samebdon/heRho/blob/main/heRho/heRho_variant_simulator.py)'

We have provided an example script demonstrating how to simulate data for use with heRho using [msprime](https://github.com/tskit-dev/msprime). The number of replicates, seeds, theta, mu, and the number of samples are set within the script, and it is written to be easily iterable by providing arguments over different recombination parameters. This script will write a folder of simulated vcf files per replicate, which are then usable following the instructions written above in workflow section A. For full instructions on using [msprime](https://github.com/tskit-dev/msprime) for simulating data please visit their documentation at https://tskit.dev/msprime/docs/stable/intro.html.
```
heRho_variant_simulator

Usage: 
heRho_variant_simulator.py -c <INT> -r <FLOAT> -g <FLOAT> -L <INT> -s <INT> -t <INT>
 
Options:
 -c, --chromosome_number <INT>                       Chromosome number
 -r, --crossover_rate <Int>                          Crossover rate
 -g, --gene_conversion_rate <FLOAT>                  Gene conversion rate
 -L, --mean_tract_length <INT>                       Mean gene conversion tract length
 -s, --sequence_length <INT>                         Sequence length
 -t, --threads <INT>                                 Thread limit
 
Example command:
python heRho_variant_simulator.py -c chromosome_5 -r 0.02 -g 0.02 -L 150 -s 10000000 -t 1
```

## Estimating parameters
-------

**A**. A fully tutorialised workflow given an input file generated in preprocessing can be run using the [Jupyter](https://jupyter.org/) notebook '[heRho/heRho_full_tutorial.ipynb](https://github.com/samebdon/heRho/blob/main/heRho/heRho_full_tutorial.ipynb)'.

To access the Jupyter interface activate your conda environment with Jupyter installed and in the heRho directory enter 'jupyter notebook' in your terminal.

**B**. A stand-alone script to estimate recombination rates per chromosome can be run using  '[heRho/heRho_stand_alone.py](https://github.com/samebdon/heRho/blob/main/heRho/heRho_stand_alone.py)'.

Usage:

```
heRho_stand_alone

Usage: 
heRho_stand_alone.py -i <FILE> [-h]
 
Options:
 -i, --input_file <FILE>                Tally of pairwise site configurations (.tsv)

Example Command
python heRho_stand_alone.py -i example_data.tsv
```
