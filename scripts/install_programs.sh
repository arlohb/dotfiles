#!/bin/bash

echo -e "Installing programs with apt"
sudo apt install -y gnome-screenshot feh zip unzip curl neofetch bat mousepad thunar kitty nitrogen rofi micro git gh zsh nala

echo -e "Installing Fira Code"
sudo apt install fonts-firacode -y

echo -e "Installing FiraCode Nerd Font"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d FiraCode
rm FiraCode.zip
cd FiraCode
rm Fura* && rm *.otf && rm *Windows*
cd ..
mkdir .fonts
mv FiraCode/* .fonts/
rm -rf FiraCode

echo -e "Installing cursors"
git clone https://github.com/alvatip/Nordzy-cursors
cd Nordzy-cursors
./install.sh
cd ..
rm -rf Nordzy-cursors

echo -e "Installing chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O chrome.deb
sudo apt install -y ./chrome.deb
rm chrome.deb

echo -e "Installing VS Code"
wget 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' -O code.deb
sudo apt install -y ./code.deb
rm code.deb

echo -e "Installing rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rm .zshenv
source ~/.cargo/env

echo -e "Installing build tools"
sudo apt install -y build-essential

echo -e "Installing rust packages"
cargo install exa

echo -e "Installing penrose_arlo WM"
cd
git clone https://github.com/arlohb/penrose_arlo.git
cd penrose_arlo
./install.sh
