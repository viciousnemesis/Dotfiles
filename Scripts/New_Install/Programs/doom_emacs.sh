#!/bin/bash


#Dependencies for, and installation of, DOOM emacs (https://github.com/hlissner/doom-emacs)
echo "Installing Doom Emacs Dependencies..."
sudo apt-get -y install emacs
sudo apt-get -y install fd-find
sudo apt-get -y install ripgrep

echo "Installing Doom Emacs..."
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

echo "Doom configuration..."
echo 'export PATH="~/.emacs.d/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
