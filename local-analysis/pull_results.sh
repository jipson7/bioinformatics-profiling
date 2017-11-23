#!/bin/bash

# pull profiling results through gclouds scp interface

mkdir -p profile-results/gpublast/
mkdir -p profile-results/barracuda/

gcloud compute scp --recurse calebrphillips@gpublast:~/profile-results/* profile-results/gpublast/
gcloud compute scp --recurse calebrphillips@barracuda:~/profile-results/* profile-results/barracuda/
