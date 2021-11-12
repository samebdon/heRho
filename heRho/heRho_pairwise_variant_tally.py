# -*- coding: utf-8 -*-

"""heRho_pairwise_variant_tally
Function as is for talling output from heRHo_variant_simulator.py

Usage: 
 heRho_pairwise_variant_tally.py -c <STR> -s <INT> -t <INT>

Options:
 -c, --chromosome_number <STR>          Chromosome number
 -s, --sequence_length <INT>			Sequence length
 -t, --threads <INT>					Thread limit

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
from tqdm import tqdm
from docopt import docopt
from pathlib import Path

from collections import Counter


def state_counts(replicates):
	#Count h0, h1, and h2 given a window of known length and the positions of known variant sites

	sample_n = replicates.split('\t')[0]
	#print(sample_n)
	replicate_n = replicates.split('\t')[1]
	#print(replicate_n)
	hzg_sites = replicates.split('\t')[2]
	hzg_sites = hzg_sites.strip('"[').strip(']"')
	try:
		hzg_sites = [int(float(pos)) for pos in hzg_sites.split(',')]
	except ValueError:
		hzg_sites = []

	#pairwise distance list
	pairwise_distances = range(1, max_pair_distance+1)
	#maximum number of comparisons per pairwise distance
	last_positions = [window_length-i for i in pairwise_distances]

	hzg_sites = list(set(hzg_sites))
	hzg_sites.sort()
	
	#state_counts
	h_2_counts = [0]*max_pair_distance
	hzg_pairwise_dict = count_distance(pos = hzg_sites, max_distance=max_pair_distance)
	for key, value in hzg_pairwise_dict.items():
		#print(key, value)
		h_2_counts[key-1] = value

	#print("H2 counted")
	#h_1_counts uncorrected for end overlap
	h_1_counts_uncorrected = [(2*len(hzg_sites)) - (2*i) for i in h_2_counts]
	#calculate the number of out of bounds comparisons
	correction = [len(list(filter(lambda x: x <= i or x >= window_length+1-i, hzg_sites))) for i in pairwise_distances]
	h_1_counts = [h_1_counts_uncorrected[i-1]-correction[i-1] for i in pairwise_distances]
	
	#print("H1 counted")
	#find h0 from remainder
	h_0_counts = [last_positions[i-1]-h_2_counts[i-1]-h_1_counts[i-1] for i in pairwise_distances]
	#print("H0 counted")

	columns = ['replicate','name','chromosome','distance','H0','H1','H2', 'theta']
	state_count_df = pd.DataFrame(index=pairwise_distances, columns=columns).fillna(0)

	state_count_df['replicate'] = [replicate_n]*max_pair_distance
	state_count_df['name'] = [sample_n]*max_pair_distance
	state_count_df['chromosome'] = [chrom]*max_pair_distance
	state_count_df['distance'] = list(range(1, max_pair_distance+1))
	state_count_df['H0'] = h_0_counts
	state_count_df['H1'] = h_1_counts
	state_count_df['H2'] = h_2_counts

	total = last_positions
	H1_frac = state_count_df['H1'] / total
	H2_frac = state_count_df['H2'] / total

	state_count_df['theta'] = (H1_frac/2) + H2_frac

	#print("finished window")

	return state_count_df

def count_distance(pos, max_distance=1000): 
    counter = collections.Counter()
    sites = np.array(pos)
    batches = np.split(sites, np.where(np.diff(sites) > max_distance + 1)[0] + 1)
    for batch in tqdm(batches, total=len(batches)):
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
                    #counter[product] += 1
            while len(pool):
                for product in itertools.product([pool.popleft()], pool):
                    counter[abs(product[1] - product[0])] += 1
                    #counter[product] += 1
    return counter

def replicate_wrapper_msprime(file_n, threads):
	with open(file_n, 'r') as fh:

		replicates = fh.read().splitlines()

		with concurrent.futures.ProcessPoolExecutor(max_workers=threads) as executor:
			results = executor.map(state_counts, replicates)

		i=0
		for state_counts_df in results:
			i+=1
			Path("heRho_tally/working_dir/"+chrom).mkdir(parents=True, exist_ok=True)
			file_name = "heRho_tally/working_dir/"+chrom+"/file_"+ str(i)+".tsv"
			state_counts_df.to_csv(file_name, sep = "\t", index=False)

def concatenate_files():
	file_tally = "heRho_tally/" + chrom + "_pairwise_variant_tally.tsv"
	with open(file_tally, 'a') as singleFile:
		first_tsv = True
		for tsv in glob.glob('./heRho_tally/working_dir/' + chrom + '/*.tsv'):
			if tsv == file_tally:
				pass
			else:
				header = True
				for line in open(tsv, 'r'):
					if first_tsv and header:
						singleFile.write(line)
						first_tsv = False
						header = False
					elif header:
						header = False
					else:
						singleFile.write(line)
		singleFile.close()
	shutil.rmtree('./heRho_tally/working_dir/' + chrom)

args = docopt(__doc__)
chrom = args['--chromosome_number']
window_length = int(args['--sequence_length'])
threads = int(args['--threads'])

file_n = 'chromosome_' + str(chrom) + '.csv'
max_pair_distance = 1000

begin_time = datetime.datetime.now()
replicate_wrapper_msprime(file_n, threads)
concatenate_files()
print(datetime.datetime.now()-begin_time)