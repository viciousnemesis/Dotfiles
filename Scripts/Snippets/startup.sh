#!/bin/bash

if ! grep -q "@reboot ~/Scripts/Snippets/startup.sh" /etc/crontab ; then
	echo "@reboot ~/Scripts/Snippets/startup.sh" | sudo tee -a /etc/crontab;
fi

#Setup capslock to behave as ctrl key
./capslock_to_ctrl.sh
