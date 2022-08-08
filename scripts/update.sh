#!/bin/bash

echo -e "Updating system"

# Until nala's upgrade bug is fixed I can't rely on it to upgrade.
# I still use it for installs

# sudo nala -y update
# sudo nala -y upgrade

sudo apt -y update
sudo apt -y upgrade

