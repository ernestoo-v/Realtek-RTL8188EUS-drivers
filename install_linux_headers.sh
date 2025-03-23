#!/bin/bash
# Ask if the user wants to install linux headers (default No)
read -p "Do you want to install linux-headers-generic? [y/N]: " install_choice
if [[ "$install_choice" =~ ^[Yy] ]]; then
    echo "Updating package lists..."
    sudo apt update
    echo "Installing linux-headers-generic..."
    sudo apt install -y linux-headers-generic
    echo "Please reboot your machine to apply the changes."
else
    echo "Skipping linux headers installation."
fi
