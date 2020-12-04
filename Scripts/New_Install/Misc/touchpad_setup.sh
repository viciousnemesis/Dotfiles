#!/bin/bash

#https://unix.stackexchange.com/questions/337008/activate-tap-to-click-on-touchpad
sudo apt-get remove xserver-xorg-input-synaptics
sudo apt-get install xserver-xorg-input-libinput

sudo mkdir /etc/X11/xorg.conf.d
echo 'Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "Tapping" "on"
EndSection' | sudo tee /etc/X11/xorg.conf.d/40-libinput.conf


systemctl restart lightdm
#systemctl restart gdm3
