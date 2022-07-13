# Linux the way I like it

Start off with Debian XFCE or somethings similar. This is so network, lightdm, and other stuff is already setup for us.
Someone more intelligent could do this from base Debian.

```bash

# Turn off the horrific beeps
sudo -i
rmmod pcspkr ; echo "blacklist pcspkr" >>/etc/modprobe.d/blacklist.conf
exit

# Install packages
sudo apt install git gh micro rofi nitrogen gnome-backgrounds kitty fonts-firacode thunar mousepad zsh bat lxappearance playerctl
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
wget https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64 -O code.deb
sudo apt install ./code.deb
rm code.deb

# Install cursors
git clone https://github.com/alvatip/Nordzy-cursors
cd Nordzy-cursors
./install.sh
cd ..
rm -rf Nordzy-cursors

# Install other fonts
curl https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d FiraCode
cd FiraCode
rm Fura* && rm *.otf && rm *Windows*
cd ..
mkdir .fonts
mv FiraCode/* .fonts/
rm -rf FiraCode

# Setup github
gh auth login # has to be in X
git config --global user.name "USERNAME"
git config --global user.email "EMAIL"

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env

# Install rust packages
cargo install exa

# Setup WM
cd
git clone https://github.com/arlohb/penrose_arlo.git
cd penrose_arlo
nitrogen /usr/share/backgrounds --save
./install.sh

# Setup oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Get dotfiles
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ".cfg" >> .gitignore
git clone --bare https://github.com/arlohb/dotfiles $HOME/.cfg
config checkout
config config --local status.showUntrackedFiles no

```
