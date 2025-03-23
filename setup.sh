#!/bin/bash

sudo apt update
#sudo apt upgrade
sudo apt-get install -y bc linux-headers-$(uname -r)

sudo rmmod r8188eu.ko

cd drivers
sudo -i
echo "blacklist r8188eu.ko" > "/etc/modprobe.d/realtek.conf"
exit

make
sudo make install
sudo modprobe 8188eu
