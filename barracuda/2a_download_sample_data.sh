#!/bin/bash

tarball=sample_data.tar.gz

mkdir -p ~/data

cd ~/data

wget -nc "https://sourceforge.net/projects/seqbarracuda/files/Sample Data/sample_data.tar.gz"

tar -zxf $tarball
rm $tarball
