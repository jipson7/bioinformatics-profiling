#!/bin/bash

# Prereq for vtune
echo 0 | sudo dd of=/proc/sys/kernel/yama/ptrace_scope
source /opt/intel/vtune_amplifier_2018/amplxe-vars.sh

timestamp=$(date +%Y-%m-%d_%H-%M-%S )

mkdir -p ~/profile-results

amplxe-cl -collect hotspots -r ~/profile-results/gpublast-vtune-$timestamp blastp -query ~/data/queries/SequenceLength_00000100.txt -db ~/data/database/sorted_env_nr -gpu t

nvprof --analysis-metrics -o ~/profile-results/gpublast-nvprof-$timestamp.nvprof blastp -query ~/data/queries/SequenceLength_00000100.txt -db ~/data/database/sorted_env_nr -gpu t
