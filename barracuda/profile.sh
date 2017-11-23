#!/bin/bash

source /opt/intel/vtune_amplifier_2018/amplxe-vars.sh

fasta=~/data/yeast_data/SRR002062.fasta
fastq=~/data/yeast_data/SRR002062.fastq
mkdir -p ~/data/yeast_output

timestamp=$(date +%Y-%m-%d_%H-%M-%S )
mkdir -p ~/profile-results

# Run vTune here
amplxe-cl -collect hotspots -r ~/profile-results/barracuda-stage1-vtune-$timestamp barracuda index $fasta

# Cuda Bound
amplxe-cl -collect hotspots -r ~/profile-results/barracuda-stage2-vtune-$timestamp barracuda aln $fasta $fastq > ~/data/yeast_output/yeast.sai
nvprof --analysis-metrics -o ~/profile-results/barracuda-stage2-nvprof-$timestamp.nvprof barracuda aln $fasta $fastq > ~/data/yeast_output/yeast.sai

# Run vTune here
amplxe-cl -collect hotspots -r ~/profile-results/barracuda-stage3-vtune-$timestamp barracuda samse $fasta ~/data/yeast_output/yeast.sai $fastq > ~/data/yeast_output/yeast.sam
