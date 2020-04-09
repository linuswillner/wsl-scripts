# wsl-scripts

A collection of my personal scripts for setting up WSL instances

## Usage

```bash
# With Git
git clone https://github.com/linuswillner/wsl-scripts

# If Git for some reason isn't available
curl -L -o wsl-scripts.zip https://github.com/linuswillner/wsl-scripts/archive/master.zip && unzip wsl-scripts.zip
```

### One-shot install

To run all installers at once, just run `sudo $os/install.sh`.

By default, most command output is suppressed. If you want to see a detailed output of what's happening, supply the `-v` flag.

### Customisable install

To run installers individually, run `$os/installers/$script.sh` (Remember to `chmod +x *.sh` first!).

By default, most command output is suppressed. If you want to see a detailed output of what's happening, add the `x` parameter (E.g. `$os/installers/$script.sh x`).

Some scripts require sudo for running. Those which require sudo privileges are marked in the [Scripts](#scripts) list with a warning sign (⚠️).

## Scripts

- Debian
  - `aliases`: Adds default bash aliases defined in `templates/.bash_aliases`
  - ⚠️ `essentials`: Installs essential software defined in `templates/essentials.txt`
  - ⚠️ `neofetch-motd`: Installs [Neofetch](https://github.com/dylanaraps/neofetch) display to the shell login
  - ⚠️ `nvm-and-node`: Installs [nvm](https://github.com/nvm-sh/nvm) and the latest version of Node.js
  - ⚠️ `thefuck`: Installs [thefuck](https://github.com/nvbn/thefuck)

- Ubuntu
  - `aliases`: Adds default bash aliases defined in `templates/.bash_aliases`
  - ⚠️ `essentials`: Installs essential software defined in `templates/essentials.txt`
  - ⚠️ `neofetch-motd`: Installs [Neofetch](https://github.com/dylanaraps/neofetch) display to the shell login
  - ⚠️ `nvm-and-node`: Installs [nvm](https://github.com/nvm-sh/nvm) and the latest version of Node.js
  - ⚠️ `thefuck`: Installs [thefuck](https://github.com/nvbn/thefuck)
