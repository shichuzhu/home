#!/usr/bin/zsh

# This scripts must be run after zsh is installed.
# This script is meant to be run without any input prompt.
# This scripts shall be run with its directory as the working directory.
# Replace placeholder {{DESKTOP_DOMAIN}} with desktop hostname in
#   1. shichuzhu_zsh/sz_shrc.bash
#   2. shichuzhu_ssh/ssh/config

# Echo commands while executing.
setopt verbose
# Stop on error
set -e

WORKDIR=$PWD

sudo apt install -y vim tmux tmuxinator git stow fonts-powerline

# clean start
rm -rf $HOME/.oh-my-zsh $HOME/.dotfiles

# install oh-my-zsh
# To install automatically without prompt https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cd ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins
git clone https://github.com/zsh-users/zsh-completions
git clone https://github.com/djui/alias-tips.git

# copy popular dotfiles
cd $WORKDIR
DD="$HOME/.dotfiles"
mkdir -p $DD

cd $DD
git clone https://github.com/gpakosz/.tmux.git

cd $WORKDIR

mkdir -p $DD/shichuzhu_ssh/.ssh
mkdir -p $DD/shichuzhu_vim
mkdir -p $DD/shichuzhu_zsh
mkdir -p $DD/shichuzhu_gpakosz_tmux
mkdir -p $DD/shichuzhu_pref

# Delete existing to avoid conflict.
rm $HOME/.ssh/config || true
rm $HOME/.vimrc || true
rm $HOME/.zshrc || true
rm $HOME/.sz_shrc.bash || true
rm "$HOME/.tmux.conf.local" || true
rm "$HOME/.tmux.conf" || true
rm -rf $HOME/.tmuxinator || true

# Use non-hidden files.
# Explicit replace default config with my own.
cp shichuzhu_ssh/ssh/config $DD/shichuzhu_ssh/.ssh/config
cp shichuzhu_vim/vimrc $DD/shichuzhu_vim/.vimrc
cp shichuzhu_zsh/zshrc $DD/shichuzhu_zsh/.zshrc
cp shichuzhu_zsh/sz_shrc.bash $DD/shichuzhu_zsh/.sz_shrc.bash
cp "shichuzhu_gpakosz_tmux/tmux.conf.local" "$DD/shichuzhu_gpakosz_tmux/.tmux.conf.local"
cp -r shichuzhu_pref/tmuxinator $DD/shichuzhu_pref/.tmuxinator
# Copy the tmux.conf file to stage to symlink.
cp "$DD/.tmux/.tmux.conf" "$DD/shichuzhu_gpakosz_tmux/.tmux.conf"

cd $DD
# Symlink to dotfiles.
# stow -nvt ~ shichuzhu_ssh # dry-run if necessary
stow -vSt ~ shichuzhu_ssh
stow -vSt ~ shichuzhu_vim
stow -vSt ~ shichuzhu_zsh
stow -vSt ~ shichuzhu_gpakosz_tmux

cd $WORKDIR

