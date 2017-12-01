#!/bin/bash

#Contains 3.5G bases
# Approx 1.7GB in size

SRA_TAR=sratoolkit.2.8.2-1-ubuntu64.tar.gz

mkdir -p ~/data/brain_data
cd ~/data

SRA_SET=SRR6261442

# Download SRA toolkit
wget -nc https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.8.2-1/sratoolkit.2.8.2-1-ubuntu64.tar.gz
tar -xzvf $SRA_TAR
rm $SRA_TAR

# Fetch data
~/data/sratoolkit.2.8.2-1-ubuntu64/bin/prefetch $SRA_SET

# Create fastq and fasta data
cd ~/data/brain_data
~/data/sratoolkit.2.8.2-1-ubuntu64/bin/fastq-dump $SRA_SET
~/data/sratoolkit.2.8.2-1-ubuntu64/bin/fastq-dump $SRA_SET --fasta
