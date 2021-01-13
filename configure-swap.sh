#!/bin/bash
#File Name: configure-swap.sh

echo "checking the space and disk space"
echo "---------------------------------"
free -h
df -h
echo "---------------------------------"
#Creating a Swap File
sudo fallocate -l 1G /swapfile
ls -lh /swapfile
#Make the file only accessible to root
sudo chmod 600 /swapfile
ls -lh /swapfile
#mark the file as swap space
sudo mkswap /swapfile
#enable the swap file, allowing our system
sudo swapon /swapfile
#check the output for the swap space
free -h
#Making the Swap File Permanent
sudo cp /etc/fstab /etc/fstab.bak
sudo echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
