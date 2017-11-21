#!/bin/bash

# Script to install GPUBlast 
# Assumes that setup_cuda.sh has already been run

# GPUBlast Url
URL=http://thales.cheme.cmu.edu/gpublast/gpu-blast-1.1_ncbi-blast-2.2.28.tar.gz

# Archive name
ARCHIVE=gpu-blast-1.1_ncbi-blast-2.2.28.tar.gz

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

#Update bashrc
echo 'export PATH=$PATH:~/blast/ncbi-blast-2.2.28+-src/c++/GCC480-ReleaseMT64/bin' >> ~/.bashrc

echo 'Installed GPUBlast'

