#!/bin/bash

echo -e "arandr."
echo -e "Save the screen file to ~/penrose_arlo/screens.sh"
echo -e "This may not be necessary. Penrose will run fine without the file.\n"
read -p "Press enter to continue"
arandr

echo -e "Installing DT's backgrounds"
sudo git clone https://gitlab.com/dwt1/wallpapers.git /usr/share/backgrounds/dt

echo -e "Installing gnome backgrounds"
sudo apt install gnome-backgrounds

echo -e "\nSelecting wallpaper."
echo -e "Remember to change mode to 'Zoomed Fill'."
echo -e "If you have have multiple monitors, you probably want to set each screen individually instead of 'Full Screen'"
read -p "Press enter to continue"
nitrogen /usr/share/backgrounds --save

echo -e "Setting up github"
gh auth login

read -p "Git(hub) username: " username
read -p "Git(hub) email   : " email
git config --global user.name $username
git config --global user.email $email

echo -e "Installing DT's shell-color-scripts"
git clone https://gitlab.com/dwt1/shell-color-scripts.git
cd shell-color-scripts
sudo make install
cd ..
rm -rf shell-color-scripts

echo -e "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
