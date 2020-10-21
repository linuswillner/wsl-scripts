#!/bin/bash
# Installs default bash aliases
# shellcheck disable=SC1090

set "-e$1"

cd "$(dirname "${BASH_SOURCE[0]}")"

cp ../templates/.bash_aliases ~/.bash_aliases
source ~/.bash_aliases
