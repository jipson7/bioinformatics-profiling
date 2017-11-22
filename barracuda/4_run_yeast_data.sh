#!/bin/bash

fasta=~/data/human_data/SRR002062.fasta
fastq=~/data/human_data/SRR002062.fastq

mkdir -p ~/data/human_output

barracuda index $fasta

barracuda aln $fasta $fastq > ~/data/human_output/human.sai

barracuda samse $fasta ~/data/human_output/human.sai $fastq > ~/data/human_output/human.sam
