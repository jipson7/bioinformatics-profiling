#!/bin/bash

# Script to install GPUBlast 
# Assumes that setup_cuda.sh has already been run

export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

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

#Update bashrc
echo 'export PATH=$PATH:~/blast/ncbi-blast-2.2.28+-src/c++/GCC480-ReleaseMT64/bin' >> ~/.bashrc

echo 'Perform these steps'
echo 'cd ~/blast'
echo 'sudo ./install'
echo 'no'
echo 'source ~/.bashrc'
