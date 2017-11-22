#!/bin/bash

mkdir -p ~/data/sample_output

barracuda index ~/data/sample_data/Saccharomyces_cerevisiae.SGD1.01.50.dna_rm.toplevel.fa

barracuda aln ~/data/sample_data/Saccharomyces_cerevisiae.SGD1.01.50.dna_rm.toplevel.fa ~/data/sample_data/sample_reads.fastq > ~/data/sample_output/quicktest.sai

barracuda samse ~/data/sample_data/Saccharomyces_cerevisiae.SGD1.01.50.dna_rm.toplevel.fa ~/data/sample_output/quicktest.sai ~/data/sample_data/sample_reads.fastq > ~/data/sample_output/quicktest.sam 
