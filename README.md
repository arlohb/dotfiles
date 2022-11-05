# Linux the way I like it

## Using

- Install debian without a desktop environment
- Get this repository (only bit of manual scripting)
    - ```sudo apt install -y git```
    - ```alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'```
    - ```echo ".cfg" >> .gitignore```
    - ```git clone --bare https://github.com/arlohb/dotfiles $HOME/.cfg```
    - ```config checkout```
    - ```config config --local status.showUntrackedFiles no```
- ```./scripts/main.sh```

## How to get wifi working on a barebones install

- Install network-manager - ```sudo apt install network-manager```
- Comment network interfaces (not loopback) in `/etc/network/interfaces` so they can be managed by NetworkManager
- Use ```nmtui``` or ```nmcli``` to manage network

## Random applications I find useful

- oversteer - configure logitech wheels
- dotmatrix - create super simple icons and glyphs
- [libresprite](https://libresprite.github.io/) - free fork of aseprite
