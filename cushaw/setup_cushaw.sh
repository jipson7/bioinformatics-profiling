#!/bin/bash

BINARY=cushaw-1.0.40.tar.gz

#Insstall deps
sudo apt -y install libz-dev

mkdir -p ~/cushaw
cd ~/cushaw

# Download and extract
wget -nc https://sourceforge.net/projects/cushaw/files/cushaw-1.0.40.tar.gz
tar -xzf $BINARY
rm $BINARY
mv cushaw-1.0.40/* .
rm -rf cushaw-1.0.40

# Turn off ECC
sudo nvidia-smi -e 0

#Compile

cd ~/cushaw/bwt_index
make
cd ~/cushaw/cushaw
make

