#!/bin/bash

#Add to sudoers
echo "Add $USER to sudoers..."
usermod -aG sudo $USER

#Update/Upgrade
echo "Update and upgrade..."
./Snippets/update_upgrade.sh

#Software
echo "Update and upgrade..."
./Snippets/install_software.sh

#Git setup
echo " General configuration commands..."
./Snippets/general_config.sh

#Config setup
echo "Dotfile Configuration setup..."
./Snippets/config_setup.sh

#Cleanup
echo "Cleaning up..."
./Snippets/update_upgrade.sh
./Snippets/autoremove.sh


