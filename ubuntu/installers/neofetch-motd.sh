#!/bin/bash
# Installs a Neofetch display to the shell startup screen

set "-e$1"

cd "$(dirname "${BASH_SOURCE[0]}")"

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root!"
  exit 1
fi

MOTD_SCRIPT=/etc/profile.d/motd.sh

sudo apt-get update
sudo apt-get install neofetch -y
sudo cp ../templates/motd.sh $MOTD_SCRIPT
sudo chmod +x $MOTD_SCRIPT
