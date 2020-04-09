#!/bin/bash
# Installs thefuck

set -e$1

cd "$(dirname "${BASH_SOURCE[0]}")"

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root!"
  exit 1
fi

sudo apt-get update > /dev/null
sudo apt-get install python3-dev python3-pip python3-setuptools -y > /dev/null
sudo pip3 install thefuck > /dev/null

# Add fuck alias to bashrc
cat <<EOF >> ~/.bashrc

# thefuck
eval "\$(thefuck --alias)"
EOF

# Reload
source ~/.bashrc
