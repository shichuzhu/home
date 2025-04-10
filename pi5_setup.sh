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
sudo apt install -y git rpi-connect zsh wireguard

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

# install atuin
echo '. "$HOME/.atuin/bin/env"' >> $HOME/.sz_shrc.bash
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

# install juicefs
# default installation path is /usr/local/bin
curl -sSL https://d.juicefs.com/install | sh -

# install miniconda
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh

sudo apt autoremove -y

# Append to this file to mitigate the error “<jemalloc>: Unsupported system page size”
echo 'kernel=kernel8.img' | sudo tee -a /boot/firmware/config.txt

echo END OF SCRIPT!
