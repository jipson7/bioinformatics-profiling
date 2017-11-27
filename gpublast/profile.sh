#!/bin/bash

# Prereq for vtune
echo 0 | sudo dd of=/proc/sys/kernel/yama/ptrace_scope
source /opt/intel/vtune_amplifier_2018/amplxe-vars.sh

test_count=5

mkdir -p ~/profile-results

for (( c=1; c<=$test_count; c++ ))
do
    echo "Running test $c"
    timestamp=$(date +%Y-%m-%d_%H-%M-%S )

    amplxe-cl -collect hotspots -r ~/profile-results/gpublast-vtune-$timestamp blastp -query ~/data/queries/SequenceLength_00000100.txt -db ~/data/database/sorted_env_nr -gpu t

    #nvprof --analysis-metrics -o ~/profile-results/gpublast-nvprof-$timestamp.nvprof blastp -query ~/data/queries/SequenceLength_00000100.txt -db ~/data/database/sorted_env_nr -gpu t
done
