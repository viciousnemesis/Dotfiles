#!/bin/bash

#Add to sudoers
echo "Add $USER to sudoers..."
usermod -aG sudo $USER

#Update/Upgrade
echo "Update and upgrade..."
../Snippets/update_upgrade.sh

#Software
echo "Update and upgrade..."
./Misc/install_software.sh

#Git setup
echo " General configuration commands..."
./Misc/general_config.sh

#Config setup
echo "Dotfile Configuration setup..."
./Misc/config_setup.sh

#Config startup scripts
echo "Startup script setup..."
../Snippets/startup.sh

#Cleanup
echo "Cleaning up..."
../Snippets/update_upgrade.sh
../Snippets/autoremove.sh


