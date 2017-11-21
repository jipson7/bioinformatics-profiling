#!/bin/bash

# Sort DB
makeblastdb -in ~/data/database/env_nr -out ~/data/database/sorted_env_nr -dbtype prot -sort_volumes -max_file_sz 500MB

# Prepare GPU DB File
blastp -query ~/data/queries/SequenceLength_00000100.txt -db ~/data/database/sorted_env_nr -gpu t -method 2
