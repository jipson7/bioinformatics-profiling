#!/bin/bash

timestamp=$(date +%Y-%m-%d_%H-%M-%S )

mkdir -p ~/profile-results

nvprof --analysis-metrics -o ~/profile-results/gpublast-nvprof-$timestamp.nvprof blastp -query ~/data/queries/SequenceLength_00000100.txt -db ~/data/database/sorted_env_nr -gpu t
