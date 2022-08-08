#!/bin/bash

echo -e "Turning off beeps"
sudo bash -c 'rmmod pcspkr ; echo "blacklist pcspkr" >>/etc/modprobe.d/blacklist.conf'

echo -e "Installing nala"
sudo apt install -y nala
sudo nala fetch --auto
