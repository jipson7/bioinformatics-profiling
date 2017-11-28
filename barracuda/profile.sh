#!/bin/bash

# Prereq for vtune
echo 0 | sudo dd of=/proc/sys/kernel/yama/ptrace_scope
source /opt/intel/vtune_amplifier_2018/amplxe-vars.sh

fasta=~/data/sample_data/Saccharomyces_cerevisiae.SGD1.01.50.dna_rm.toplevel.fa
fastq=~/data/sample_data/sample_reads.fastq
mkdir -p ~/data/sample_output

mkdir -p ~/profile-results

test_count=3

for (( c=1; c<=$test_count; c++ ))
do
    timestamp=$(date +%Y-%m-%d_%H-%M-%S )

    # Run vTune here
    amplxe-cl -collect hotspots -r ~/profile-results/barracuda-stage1-vtune-$timestamp barracuda index $fasta

    # Cuda Bound
    amplxe-cl -collect hotspots -r ~/profile-results/barracuda-stage2-vtune-$timestamp barracuda aln $fasta $fastq > ~/data/sample_output/sample.sai
    #nvprof --analysis-metrics -o ~/profile-results/barracuda-stage2-nvprof-$timestamp.nvprof barracuda aln $fasta $fastq > ~/data/sample_output/sample.sai

    # Run vTune here
    amplxe-cl -collect hotspots -r ~/profile-results/barracuda-stage3-vtune-$timestamp barracuda samse $fasta ~/data/sample_output/sample.sai $fastq > ~/data/sample_output/sample.sam
done
