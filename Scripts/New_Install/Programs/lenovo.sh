#!/bin/bash

# Power saving and bluetooth https://linrunner.de/tlp/installation/ubuntu.html

sudo add-apt-repository ppa:linrunner/tlp
sudo apt update

sudo apt install tlp tlp-rdw

sudo cp ./.lenovo/tlp.conf /etc/tlp.conf

sudo tlp start

systemctl enable tlp.service



# Battery threshold setup: https://askubuntu.com/questions/34452/how-can-i-limit-battery-charging-to-80-capacity
#sudo apt-get install tp-smapi-dkms
#sudo modprobe tp_smapi

#echo 40 | sudo tee /sys/devices/platform/smapi/BAT0/start_charge_thresh
#echo 80 | sudo tee /sys/devices/platform/smapi/BAT0/stop_charge_thresh
