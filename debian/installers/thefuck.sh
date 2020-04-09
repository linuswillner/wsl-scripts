#!/bin/bash
# Installs thefuck

set -e$1

cd "$(dirname "${BASH_SOURCE[0]}")"

sudo apt-get update > /dev/null
sudo apt-get install python3-dev python3-pip python3-setuptools -y > /dev/null
sudo pip3 install thefuck > /dev/null

# Add fuck alias to bashrc (For some reason echoing to bashrc breaks rather spectacularly)
fuck
fuck

# Reload shell
source ~/.bashrc
