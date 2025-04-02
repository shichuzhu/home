#!/bin/sh

# This script is meant to be run after cloning the repo
# git clone https://github.com/shichuzhu/home.git
# This script must be run in the download directory (WORK_DIR).
# ./setup_ubuntu.sh

set -e
set -v

WORK_DIR=$PWD
echo current directory is: $PWD

sudo apt update
sudo apt full-upgrade -y
sudo apt upgrade -y
sudo apt install -y git zsh parcellite xsel

./init_headless.sh

# copy popular dotfiles
DD="$HOME/.dotfiles"
mkdir -p $DD/shichuzhu_pref/.config/parcellite
mkdir -p $DD/shichuzhu_pref/.config/dconf

# Delete existing to avoid conflict. Do not error if do not exist.
rm -rf $HOME/.config/dconf $HOME/.config/parcellite || true

# Use non-hidden files.
# Explicit replace default config with my own.
cp -r shichuzhu_pref/tmuxinator $DD/shichuzhu_pref/.tmuxinator
cp shichuzhu_pref/config/parcellite/parcelliterc $DD/shichuzhu_pref/.config/parcellite/
cp shichuzhu_pref/config/dconf/user $DD/shichuzhu_pref/.config/dconf/

cd $DD
# Symlink to dotfiles.
# stow -nvt ~ shichuzhu_ssh # dry-run if necessary
stow -vSt ~ shichuzhu_pref

# guake
cd $WORKDIR
sudo apt install guake
guake --restore-preferences guake_prefs

# <<<<<<<<<<<<< INTERACTIVE START <<<<<<<<<<<<
sudo -k chsh -s $(command -v zsh) "$USER"
# >>>>>>>>>>>>> INTERACTIVE END >>>>>>>>>>>>>>

curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

sudo apt autoremove

echo END OF SCRIPT!
