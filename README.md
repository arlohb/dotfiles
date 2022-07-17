# Linux the way I like it

Start off with Debian XFCE or somethings similar. This is so network, lightdm, and other stuff is already setup for us.
Someone more intelligent could do this from base Debian.

To start random scripts that run in the background I'm currently using pm2. Systemd would probably be a better fit.

## Without X

```bash

sudo apt install picom lxpolkit lxappearance xorg lightdm arandr pulseaudio pavucontrol alsa-utils gnome-screenshot feh zip -y

```

```bash

# Turn off the horrific beeps
sudo bash -c 'rmmod pcspkr ; echo "blacklist pcspkr" >>/etc/modprobe.d/blacklist.conf'

# Install packages
sudo apt update
sudo apt upgrade

sudo apt install git gh micro rofi nitrogen kitty fonts-firacode thunar mousepad zsh bat lxappearance neofetch curl unzip gnome-keyring -y

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

wget 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' -O code.deb
sudo apt install ./code.deb
rm code.deb

# Install cursors
git clone https://github.com/alvatip/Nordzy-cursors
cd Nordzy-cursors
./install.sh
cd ..
rm -rf Nordzy-cursors

# Install other fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d FiraCode
rm FiraCode.zip
cd FiraCode
rm Fura* && rm *.otf && rm *Windows*
cd ..
mkdir .fonts
mv FiraCode/* .fonts/
rm -rf FiraCode

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rm .zshenv
source ~/.cargo/env

# Install rust packages
sudo apt install build-essential
cargo install exa

# Setup WM
cd
git clone https://github.com/arlohb/penrose_arlo.git
cd penrose_arlo
./install.sh

# You can now login to the WM
sudo reboot
# The first time, you will have to select penrose arlo in lightdm as it is not the default Xsession

# This may not be needed with just 1 monitor
# Save to $HOME/penrose_arlo/screens.sh
# This will then be ran by penrose_arlo when it starts
arandr

# Set wallpaper

# optional:
sudo git clone https://gitlab.com/dwt1/wallpapers.git /usr/share/backgrounds/dt

# optional:
sudo apt install gnome-backgrounds

# The selected wallpaper will load when penrose starts
# Remember to set mode to "Zoomed Fill"
# If you have have multiple monitors, you probably want to set each screen individually instead of "Full Screen"
nitrogen /usr/share/backgrounds --save

# Setup github
gh auth login
git config --global user.name "USERNAME"
git config --global user.email "EMAIL"

# Install dt's colorscript
git clone https://gitlab.com/dwt1/shell-color-scripts.git
cd shell-color-scripts
sudo make install
cd ..
rm -rf shell-color-scripts

# Setup oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Get dotfiles
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ".cfg" >> .gitignore
git clone --bare https://github.com/arlohb/dotfiles $HOME/.cfg
config checkout
config config --local status.showUntrackedFiles no

```

# Random applications I find useful

- oversteer - configure logitech wheels
- dotmatrix - create super simple icons and glyphs
