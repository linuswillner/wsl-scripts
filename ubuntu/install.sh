#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# Define some colour shortcuts
RESET=$(echo $'\033[0m')
BOLD=$(echo $'\e[1m')
RED=$(echo $'\e[31m')
GREEN=$(echo $'\e[32m')
CYAN=$(echo $'\e[36m')
BGREEN=$(echo $'\e[1m\e[32m')

# Usage: prettyecho <message> <color>
prettyecho () {
  echo "${2}${1}${RESET}"
}

if [[ $EUID -ne 0 ]]; then
  prettyecho "This script must be run as root!" $RED
  exit 1
fi

# If running in verbose mode, set -x for all scripts
if [[ $1 = "-v" ]]; then
  VERBOSE=x
fi

# Make all installers executable
sudo chmod +x installers/*.sh

# Usage: run_installer <verbose> <is verbose = x>
run_installer () {
  if [[ -z "$1" ]]
  then
    prettyecho "No installer supplied!" $RED
    return 1
  else
    installers/$1.sh $VERBOSE
  fi
    
  if [[ $? -ne 0 ]]
  then
    prettyecho "Installer $1 failed!" $RED
    exit 1
  fi
  
  prettyecho "Success!" $GREEN
  return 0
}

prettyecho "Installing essential software..." $CYAN
run_installer essentials

prettyecho "Installing default bash aliases..." $CYAN
run_installer aliases

prettyecho "Installing thefuck..." $CYAN
run_installer thefuck

prettyecho "Installing Neofetch start-up display..." $CYAN
run_installer neofetch-motd

prettyecho "Installation completed!" $BGREEN
exit 0
