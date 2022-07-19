# Linux the way I like it

## Using

- Install debian wihout a desktop environment
- Get this repository (only bit of manual scripting)
    - ```sudo apt install -y git```
    - ```alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'```
    - ```echo ".cfg" >> .gitignore```
    - ```git clone --bare https://github.com/arlohb/dotfiles $HOME/.cfg```
    - ```config checkout```
    - ```config config --local status.showUntrackedFiles no```
- ```./scripts/main.sh```

## Random applications I find useful

- oversteer - configure logitech wheels
- dotmatrix - create super simple icons and glyphs
- [libresprite](https://libresprite.github.io/) - free fork of aseprite
