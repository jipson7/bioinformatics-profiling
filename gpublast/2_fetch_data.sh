#!/bin/bash

# Download data for tests

mkdir -p ~/data/database
cd ~/data/database
wget ftp://ftp.ncbi.nlm.nih.gov/blast/db/FASTA/env_nr.gz
gunzip env_nr.gz
rm env_nr.gz

mkdir -p ~/data/queries
cd ~/data/queries
wget http://thales.cheme.cmu.edu/gpublast/old/queries.tar.gz
tar -xzf queries.tar.gz
rm queries.tar.gz
