#!/bin/bash

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}


# Basic programs
echo "Basic programs..."
install curl
install htop
install nmap
install software-properties-common
install vim
install vlc
install wget


# Advanced setup programs
echo "Advanced programs..."
for f in ../Programs/*.sh; do bash "$f" -H; done

