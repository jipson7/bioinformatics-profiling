#!/bin/bash

# Script to install GPUBlast and download data
# Assumes that setup_cuda.sh has already been run

# GPUBlast Url
URL=http://thales.cheme.cmu.edu/gpublast/gpu-blast-1.1_ncbi-blast-2.2.28.tar.gz

# Archive name
ARCHIVE=gpu-blast-1.1_ncbi-blast-2.2.28.tar.gz

# Data Urls
DATA1=ftp://ftp.ncbi.nlm.nih.gov/blast/db/env_nr.00.tar.gz
DATA2=ftp://ftp.ncbi.nlm.nih.gov/blast/db/env_nr.01.tar.gz

#tarball names
TARBALL1=env_nr.00.tar.gz
TARBALL2=env_nr.01.tar.gz

# Download Binaries
mkdir -p ~/blast
cd ~/blast
wget $URL

# Extract
tar -xzvf $ARCHIVE
rm $ARCHIVE

# Install
chmod +x install
printf 'no\n' | sudo ./install

# Download data
mkdir -p ~/data/database
cd ~/data/database
wget $DATA1
wget $DATA2

tar -xzvf $TARBALL1
rm $TARBALL1
tar -xzvf $TARBALL2
rm $TARBALL2

echo 'Install GPUBlast and downloaded data'
echo 'Need to download queries'

