#!/bin/bash

echo "\n./scripts/niceties.sh\n"
./scripts/niceties.sh

echo "\n./scripts/update.sh\n"
./scripts/update.sh

echo "\n./scripts/install_x.sh\n"
./scripts/install_x.sh

echo "\n./scripts/install_programs.sh\n"
./scripts/install_programs.sh


clear

echo "The system will now reboot.\n"

echo "Once this happens, select penrose arlo in lightdm."
echo "You'll only have to do this the first time.\n"

echo "Once you've logged in, press super+T to open a terminal,"
echo "and run `./scripts/setup.sh`\n"

read -p "Press enter to continue"

sudo reboot
