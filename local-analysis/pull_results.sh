#!/bin/bash

mkdir -p profile-results

gcloud compute scp calebrphillips@gpublast:~/profile-results/* profile-results/
