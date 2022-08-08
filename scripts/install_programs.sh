#!/bin/bash

echo -e "Installing programs with nala"
sudo nala install -y gnome-screenshot feh zip unzip curl neofetch bat mousepad thunar kitty nitrogen rofi micro git gh zsh fonts-firacode

echo -e "Installing rofi-calc"
sudo nala install -y rofi-dev qalc libtool
git clone https://github.com/svenstaro/rofi-calc
cd rofi-calc
autoreconf -i
mkdir build
cd build
../configure
make
sudo make install
cd
rm -rf rofi-calc

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
sudo nala install -y ./chrome.deb
rm chrome.deb

echo -e "Installing rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rm .zshenv
source ~/.cargo/env

echo -e "Installing build tools"
sudo nala install -y build-essential

echo -e "Installing rust packages"
cargo install exa

echo -e "Installing spacemacs"
git clone git://git.sv.gnu.org/emacs.git
cd emacs
make
sudo make install
cd
rm -rf emacs

echo -e "Installing penrose_arlo WM"
cd
git clone https://github.com/arlohb/penrose_arlo.git
cd penrose_arlo
./install.sh
