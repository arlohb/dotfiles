# Linux the way I like it

Start off with Debian XFCE or somethings similar. This is so network, lightdm, and other stuff is already setup for us.
Someone more intelligent could do this from base Debian.

```bash

# Turn off the horrific beeps
sudo -i
rmmod pcspkr ; echo "blacklist pcspkr" >>/etc/modprobe.d/blacklist.conf
exit

# Install necessary packages
sudo apt install git gh micro rofi nitrogen gnome-backgrounds kitty fonts-firacode thunar mousepad zsh

# Setup github
gh auth login # has to be in X
git config --global user.name "USERNAME"
git config --global user.email "EMAIL"

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env

# Setup WM
git clone https://github.com/arlohb/penrose_arlo.git
cd penrose_arlo
sudo apt install build-essential pkg-config libgtk-3-dev libxcb-randr0-dev
cargo build --release
nitrogen /usr/share/backgrounds --save
# You may need to change Exec path to where penrose_arlo is located
sudo cp penrose_arlo.desktop /usr/share/xsessions/

# Setup oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Get dotfiles
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ".cfg" >> .gitignore
git clone --bare https://github.com/arlohb/dotfiles $HOME/.cfg
config checkout
config config --local status.showUntrackedFiles no

```
