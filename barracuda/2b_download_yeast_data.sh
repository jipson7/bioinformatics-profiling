#!/bin/bash

SRA_TAR=sratoolkit.2.8.2-1-ubuntu64.tar.gz

mkdir -p ~/data/yeast_data
cd ~/data

# Download SRA toolkit
wget -nc https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.8.2-1/sratoolkit.2.8.2-1-ubuntu64.tar.gz
tar -xzvf $SRA_TAR
rm $SRA_TAR

# Fetch data
~/data/sratoolkit.2.8.2-1-ubuntu64/bin/prefetch SRR002062

# Create fastq and fasta data
cd ~/data/yeast_data
~/data/sratoolkit.2.8.2-1-ubuntu64/bin/fastq-dump SRR002062
~/data/sratoolkit.2.8.2-1-ubuntu64/bin/fastq-dump SRR002062 --fasta
