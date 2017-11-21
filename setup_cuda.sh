#!/bin/bash

# Script to help setup cuda on a GPU driver google cloud instance with Ubuntu 14.04

# URL for CUDA 7.5 and ubuntu 14.04
CUDA=http://developer.download.nvidia.com/compute/cuda/7.5/Prod/local_installers/cuda-repo-ubuntu1404-7-5-local_7.5-18_amd64.deb

# Initial setup
sudo apt update
sudo apt -y upgrade

# Instll gcc
sudo apt -y install build-essential

# Get Kernel Headers
sudo apt -y install linux-headers-$(uname -r)

# Download cuda binaries to binaries folder
mkdir -p ~/binaries
cd ~/binaries
wget -nc $CUDA

# Install CUDA
sudo dpkg -i cuda-repo-ubuntu1404-7-5-local_7.5-18_amd64.deb
sudo apt-get update
sudo apt-get -y install cuda

# Update bashrc
echo 'export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}' >> ~/.bashrc 
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.bashrc 

echo 'Finished, should reboot'
