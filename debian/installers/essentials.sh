#!/bin/bash
# Installs essential default software

set -e$1

cd "$(dirname "${BASH_SOURCE[0]}")"

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root!"
  exit 1
fi

sudo apt-get update > /dev/null
sudo apt-get install -y $(cat ../templates/essentials.txt | tr -s '\n' ' ') > /dev/null
