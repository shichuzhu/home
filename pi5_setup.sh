#!/bin/sh

# This script is meant to be run after cloning the repo
# git clone https://github.com/shichuzhu/home.git
# This script must be run in the download directory.
# ./setup_pi5.sh

set -e
set -v

WORK_DIR=$PWD
echo current directory is: $PWD

sudo apt update
sudo apt full-upgrade -y
sudo apt upgrade -y
sudo apt install -y git rpi-connect zsh

rpi-connect on

# <<<<<<<<<<<<< INTERACTIVE START <<<<<<<<<<<<
# This will block until registered.
# Mute already signed in error
rpi-connect signin || true
# >>>>>>>>>>>>> INTERACTIVE END >>>>>>>>>>>>>>

./init_headless.sh
# <<<<<<<<<<<<< INTERACTIVE START <<<<<<<<<<<<
sudo -k chsh -s $(command -v zsh) "$USER"
# >>>>>>>>>>>>> INTERACTIVE END >>>>>>>>>>>>>>

curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

sudo apt autoremove -y

echo END OF SCRIPT!
