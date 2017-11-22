#!/bin/bash

url=http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/12398/vtune_amplifier_2018_update1.tar.gz

key="VBD4-8DKJDRG8"

tar_file=vtune_amplifier_2018_update1.tar.gz

mkdir -p ~/binaries
cd ~/binaries

wget -nc $url
tar -xzvf $tar_file
rm $tar_file


echo "Can now install vTune"
echo "Use $key as serial"
