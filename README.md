heRho
=========
heterozygosity-based estimator of Rho

heRho estimates crossover rates, gene conversion rates, and the mean gene conversion tract length using distance-dependent heterozygosity data from single diploid genomes in a simple composite-likelihood scheme. heRho can be run either using variant data from real genomes or via simulations using [msprime](https://github.com/tskit-dev/msprime). More information about the method and implementation can be read on [bioRxiv](https://www.biorxiv.org/content/10.1101/2021.11.09.467857v1.full.pdf).

## Dependencies (via [conda](https://conda.io/miniconda.html))
-------
```
conda create -n herho && \
conda activate herho && \
conda install pandas numpy pybedtools tqdm docopt scikit-allel tabix  nlopt math multiprocessing matplotlib
```

# Workflow

## Preprocessing: tally pairwise variant configurations using variant data or simulations
-------
**A**. Variant data - '[heRho/heRho_tally_pairwise_counts_vcf.py](https://github.com/samebdon/heRho/blob/main/heRho/heRho_tally_pairwise_counts_vcf.py)'

Input: VCF file assuming one diploid per read group. Optional BED file delegating regions to tally.

Output: Data tsv compliant with parameter estimation scripts (example at heRho/example_data.tsv).

Usage:

```
heRho_pairwise_variant_tally

Usage: 
 heRho_tally_pairwise_counts_vcf.py -v <FILE> [-h -b <FILE> -d <INT> -t <INT> -s <STR> -c <STR> -f <STR>]

Options:
 -v, --vcf <FILE>                       VCF file
 -b, --bed <FILE>                       Bed file (Optional, Default: Whole chromosomes)
 -d, --distance <INT>                   Max pairwise distance (Default: 1000)
 -t, --threads <INT>                    Thread limit (parallelised per chromosome, Default: 1)
 -s, --samples <STR>                    Comma separated list of samples to analyse (Default: all samples)
 -c, --chromosomes <STR>                Comma separated list of chromosomes to analyse (Default: all chromosomes)
 -f, --file_prefix <STR>                Optional file prefix

Example command:
python heRho_tally_pairwise_counts_vcf.py -v vcf_file.vcf.gz -b bed_file.bed -d 1000 -t 1 -s sample_1,sample2 -c chrom_1,chrom_2 -f tally_1
```

**B**. Simulations - 
```
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

# Example Command
# python heRho_stand_alone.py -i example_data.tsv
```
