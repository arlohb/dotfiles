#!bin/bash

echo "Turning off beeps"
sudo bash -c 'rmmod pcspkr ; echo "blacklist pcspkr" >>/etc/modprobe.d/blacklist.conf'
