#!/bin/bash
# Installs essential default software
# shellcheck disable=SC2002

set "-e$1"

cd "$(dirname "${BASH_SOURCE[0]}")"

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root!"
  exit 1
fi

sudo apt-get update
sudo apt-get install -y "$(cat ../templates/essentials.txt | tr -s '\n' ' ')"
