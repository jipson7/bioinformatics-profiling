#!/bin/bash


fasta=~/data/yeast_data/SRR002062.fasta
fastq=~/data/yeast_data/SRR002062.fastq
mkdir -p ~/data/yeast_output

timestamp=$(date +%Y-%m-%d_%H-%M-%S )
mkdir -p ~/profile-results

# Run vTune here
barracuda index $fasta

# Cuda Bound
nvprof --analysis-metrics -o ~/profile-results/barracuda-stage2-nvprof-$timestamp.nvprof barracuda aln $fasta $fastq > ~/data/yeast_output/yeast.sai

# Run vTune here
barracuda samse $fasta ~/data/yeast_output/yeast.sai $fastq > ~/data/yeast_output/yeast.sam
