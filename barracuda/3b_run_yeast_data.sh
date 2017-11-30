#!/bin/bash

fasta=~/data/yeast_data/SRR002062.fasta
fastq=~/data/yeast_data/SRR002062.fastq

mkdir -p ~/data/yeast_output

barracuda index $fasta

barracuda aln $fasta $fastq > ~/data/yeast_output/yeast.sai

barracuda samse $fasta ~/data/yeast_output/yeast.sai $fastq > ~/data/yeast_output/yeast.sam
