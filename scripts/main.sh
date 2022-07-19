#!/bin/bash

echo -e "\n./scripts/niceties.sh\n"
./scripts/niceties.sh

echo -e "\n./scripts/update.sh\n"
./scripts/update.sh

echo -e "\n./scripts/install_x.sh\n"
./scripts/install_x.sh

echo -e "\n./scripts/install_programs.sh\n"
./scripts/install_programs.sh


clear

echo -e "The system will now reboot.\n"

echo -e "Once this happens, select penrose arlo in lightdm."
echo -e "You'll only have to do this the first time.\n"

echo -e "Once you've logged in, press super+T to open a terminal,"
echo -e "and run `./scripts/setup.sh`\n"

read -p "Press enter to continue"

sudo reboot
