#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""heRho_variant_simulator

Usage: 
 heRho_variant_simulator.py -c <INT> -r <FLOAT> -g <FLOAT> -L <INT> -s <INT> -t <INT>

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

def sim_replicates(seeds):
	
	ancestry_seed, mutation_seed = seeds

	ancestry_reps = msprime.sim_ancestry(
		samples=samples, 
		recombination_rate=rbp,
		gene_conversion_rate=gbp,
		gene_conversion_tract_length=mean_tract_length, 
		sequence_length=sequence_length,
		population_size=pop_size,
		num_replicates=num_replicates,
		random_seed=ancestry_seed)
	
	for ts in ancestry_reps:
		mutated_ts = msprime.sim_mutations(
			ts, 
			rate=mu, 
			random_seed=mutation_seed)
			### discrete_genome=False)

		#list of variant positions
		var_site_list = [var.site.position for var in mutated_ts.variants()]
		
		#list of arrays of each chromosomes genotype at each variant position
		genotype_list = [var.genotypes for var in mutated_ts.variants()]
		haplotype_dict = {}
		i = 0
		sample_count = 1
		while sample_count <= (samples):
			individual_genotype = [genotype[i]+genotype[i+1] for genotype in genotype_list]
			individual_genotype = [0 if x==2 else x for x in individual_genotype]
			individual_sites = [a*b for a,b in zip(individual_genotype, var_site_list)]
			individual_sites = [i for i in individual_sites if i != 0]
			haplotype_dict[sample_count] = individual_sites
			i+=2
			sample_count += 1

		print("Replicate seed " + str(ancestry_seed) + "/" + str(mutation_seed) + " completed.")
		
		return haplotype_dict

def sim_wrapper(seeds, threads):
	
	with concurrent.futures.ProcessPoolExecutor(max_workers=threads) as executor:
		results = executor.map(sim_replicates, seeds)
		S = np.array(list(results), dtype=object)

		with open("chromosome_"+str(chromosome_number)+".csv", "w") as file_h:
			writer = csv.writer(file_h, delimiter='\t')
			rep_n = 1
			for replicate in S:
				for sample, pos in replicate.items():
					writer.writerow([str(sample), str(rep_n), pos])
				rep_n+=1


#global parameters
rng=np.random.RandomState()
num_replicates = 100
seeds = rng.randint(1, 2**31, size=(num_replicates, 2))
theta=0.0071
mu=5.4e-9
ne= theta/(4*mu)
pop_size=ne
samples=10

args = docopt(__doc__)
chromosome_number = args['--chromosome_number']
crossover_rate = args['--crossover_rate']
gene_conversion_rate = args['--gene_conversion_rate']
mean_tract_length = args['--mean_tract_length']
sequence_length = args['--sequence_length']
threads = int(args['--threads'])

gbp = float(gene_conversion_rate)/(4*ne)
rbp = float(crossover_rate)/(4*ne)

begin_time = datetime.datetime.now()
sim_wrapper(seeds=seeds, threads=threads)
print(datetime.datetime.now()-begin_time)