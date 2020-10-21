#!/bin/bash
# Installs thefuck
# shellcheck disable=SC1090

set "-e$1"

cd "$(dirname "${BASH_SOURCE[0]}")"

sudo apt-get update
sudo apt-get install python3-dev python3-pip python3-setuptools -y
sudo pip3 install thefuck

# Add fuck alias to bashrc (For some reason echoing to bashrc breaks rather spectacularly)
fuck
fuck

# Reload shell
source ~/.bashrc
