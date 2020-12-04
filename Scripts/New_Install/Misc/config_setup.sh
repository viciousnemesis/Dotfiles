#!/bin/bash


#Dotfile import
echo "Docfile import..."
echo "alias config='/usr/bin/git --git-dir=$HOME/Dotfiles --work-tree=$HOME'" >> $HOME/.bash_aliases
if [ ! -d "$HOME/Dotfiles.git" ]; then mkdir $HOME/Dotfiles.git; fi
git clone --bare https://github.com/viciousnemesis/Dotfiles $HOME
bash
config config --local status.showUntrackedFiles
