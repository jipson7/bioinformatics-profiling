#!/bin/bash

# Prereq for vtune
echo 0 | sudo dd of=/proc/sys/kernel/yama/ptrace_scope
source /opt/intel/vtune_amplifier_2018/amplxe-vars.sh

fasta=~/data/yeast_data/SRR002062.fasta
fastq=~/data/yeast_data/SRR002062.fastq
mkdir -p ~/data/yeast_output

mkdir -p ~/profile-results

test_count=10

for (( c=1; c<=$test_count; c++ ))
do

    timestamp=$(date +%Y-%m-%d_%H-%M-%S )

    # Run vTune here
    #amplxe-cl -collect hotspots -r ~/profile-results/barracuda-large-stage1-vtune-$timestamp barracuda index $fasta

    # Cuda Bound
    time barracuda aln $fasta $fastq > ~/data/yeast_output/yeast.sai
    #nvprof --analysis-metrics -o ~/profile-results/barracuda-large-stage2-nvprof-$timestamp.nvprof barracuda aln $fasta $fastq > ~/data/yeast_output/yeast.sai

    # Run vTune here
    #amplxe-cl -collect hotspots -r ~/profile-results/barracuda-large-stage3-vtune-$timestamp barracuda samse $fasta ~/data/yeast_output/yeast.sai $fastq > ~/data/yeast_output/yeast.sam
done
