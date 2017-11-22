#!/bin/bash

url=http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/12374/parallel_studio_xe_2018_update1_cluster_edition.tgz

key="2T5V-4MV68JSZ"

tar_file=parallel_studio_xe_2018_update1_cluster_edition.tgz

mkdir -p ~/binaries
cd ~/binaries

wget -nc $url
tar -xzvf $tar_file
rm $tar_file


echo "Can now install vTune"
echo "Use $key as serial"
