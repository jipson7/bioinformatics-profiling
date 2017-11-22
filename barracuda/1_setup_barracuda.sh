#!/bin/bash

BINARY=barracuda_0.7.107h.tar.gz

sudo apt -y install libz-dev

cd ~

wget -nc "https://sourceforge.net/projects/seqbarracuda/files/Source Code/Version 0.7.0/barracuda_0.7.107h.tar.gz"

tar -xzf $BINARY

rm $BINARY

cd barracuda

make all

echo 'export PATH=$PATH:~/barracuda/bin' >> ~/.bashrc

echo 'All done, remember to source bashrc you fool!!'
