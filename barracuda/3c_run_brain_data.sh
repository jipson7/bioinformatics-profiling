#!/bin/bash

fasta=~/data/brain_data/SRR6261442.fasta
fastq=~/data/brain_data/SRR6261442.fastq

mkdir -p ~/data/brain_output

barracuda index $fasta

barracuda aln $fasta $fastq > ~/data/brain_output/brain.sai

barracuda samse $fasta ~/data/brain_output/brain.sai $fastq > ~/data/brain_output/brain.sam
