#!/bin/bash


fasta=~/data/yeast_data/SRR002062.fasta
fastq=~/data/yeast_data/SRR002062.fastq
mkdir -p ~/data/yeast_output

timestamp=$(date +%Y-%m-%d_%H-%M-%S )
mkdir -p ~/profile-results

cmd1="barracuda index $fasta"
cmd2="barracuda aln $fasta $fastq > ~/data/yeast_output/yeast.sai"
cmd3="barracuda samse $fasta ~/data/yeast_output/yeast.sai $fastq > ~/data/yeast_output/yeast.sam"

nvprof --analysis-metrics -o ~/profile-results/barracuda-stage1-nvprof-$timestamp.nvprof $cmd1
nvprof --analysis-metrics -o ~/profile-results/barracuda-stage2-nvprof-$timestamp.nvprof $cmd2
nvprof --analysis-metrics -o ~/profile-results/barracuda-stage3-nvprof-$timestamp.nvprof $cmd3
