#!/bin/bash
# Installs nvm and latest Node.js

set -e$1

cd "$(dirname "${BASH_SOURCE[0]}")"

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root!"
  exit 1
fi

# Get latest nvm version
NVM_VERSION=$(curl -s https://api.github.com/repos/nvm-sh/nvm/releases/latest | jq -r '.tag_name')

# Get download URL for the latest version
NVM_DOWNLOAD_URL="https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/install.sh"

# Run the installer
curl -s -o- $NVM_DOWNLOAD_URL | bash > /dev/null
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # Load nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # Load nvm bash_completion

# Install latest Node.js
nvm install node > /dev/null
