#!/bin/bash
# Removes snap and snapd

set "-e$1"

cd "$(dirname "${BASH_SOURCE[0]}")"

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root!"
  exit 1
fi

# Get and remove all snaps
snap list --all | awk '{ if (!($1 == "Name")) print $1 }' |
  while read -r snapname; do
    echo "Removing snap $snapname"
    sudo snap remove "$snapname"
  done

# Purge snapd from apt

echo "Purging snapd..."

sudo apt-get purge snapd

# Remove directories used by Snap

echo "Removing Snap directories..."

rm -rf ~/snap
sudo rm -rf /snap
sudo rm -rf /var/snap
sudo rm -rf /var/lib/snapd

echo "Done!"
