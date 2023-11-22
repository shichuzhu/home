#!/usr/bin/zsh

# This scripts must be run after zsh is installed.
# This scripts shall be run with its directory as the working directory.
# Replace placeholder {{DESKTOP_DOMAIN}} with desktop hostname in
#   1. shichuzhu_zsh/sz_shrc.bash
#   2. shichuzhu_ssh/ssh/config

# Echo commands while executing.
setopt verbose

WORKDIR=$PWD

sudo apt install tmux xsel tmuxinator git stow fonts-powerline
sudo apt install parcellite

# clean start
rm -rf $HOME/.oh-my-zsh $HOME/.dotfiles

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
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

mkdir -p $DD/shichuzhu_pref/.config/parcellite
mkdir -p $DD/shichuzhu_pref/.config/dconf

# Delete existing to avoid conflict.
rm $HOME/.ssh/config
rm $HOME/.vimrc
rm $HOME/.zshrc
rm $HOME/.sz_shrc.bash
rm "$HOME/.tmux.conf.local"
rm "$HOME/.tmux.conf"
rm -rf $HOME/.tmuxinator

rm -rf $HOME/.config/dconf $HOME/.config/parcellite

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

cp shichuzhu_pref/config/parcellite/parcelliterc $DD/shichuzhu_pref/.config/parcellite/
cp shichuzhu_pref/config/dconf/user $DD/shichuzhu_pref/.config/dconf/

cd $DD
# Symlink to dotfiles.
# stow -nvt ~ shichuzhu_ssh # dry-run if necessary
stow -vSt ~ shichuzhu_ssh
stow -vSt ~ shichuzhu_vim
stow -vSt ~ shichuzhu_zsh
stow -vSt ~ shichuzhu_gpakosz_tmux
stow -vSt ~ shichuzhu_pref

# guake
cd $WORKDIR
sudo apt install guake
guake --restore-preferences guake_prefs
