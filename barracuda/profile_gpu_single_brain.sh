#!/bin/bash

# Prereq for vtune
echo 0 | sudo dd of=/proc/sys/kernel/yama/ptrace_scope
source /opt/intel/vtune_amplifier_2018/amplxe-vars.sh

fasta=~/data/brain_data/SRR6261442.fasta
fastq=~/data/brain_data/SRR6261442.fastq
mkdir -p ~/data/brain_output

mkdir -p ~/profile-results

test_count=5

for (( c=1; c<=$test_count; c++ ))
do

    timestamp=$(date +%Y-%m-%d_%H-%M-%S )

    # Run vTune here
    #amplxe-cl -collect hotspots -r ~/profile-results/barracuda-large-stage1-vtune-$timestamp barracuda index $fasta

    # Cuda Bound
    time barracuda aln $fasta $fastq > ~/data/brain_output/brain.sai
    #nvprof --analysis-metrics -o ~/profile-results/barracuda-large-stage2-nvprof-$timestamp.nvprof barracuda aln $fasta $fastq > ~/data/brain_output/brain.sai

    # Run vTune here
    #amplxe-cl -collect hotspots -r ~/profile-results/barracuda-large-stage3-vtune-$timestamp barracuda samse $fasta ~/data/brain_output/brain.sai $fastq > ~/data/brain_output/brain.sam
done
