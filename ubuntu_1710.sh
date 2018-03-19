#!/bin/bash
# sudo apt update
# sudo apt install vim emacs git dkms openssh-server tmux iotop
## adjust ssh port # /etc/ssh/sshd_config --> 49222
# sudo systemctl restart ssh

## install chrome
## sudo dpkg -i *.deb
# sudo apt install -f

## install displaylink driver ubuntu
## follow post https://support.displaylink.com/knowledgebase/articles/1843660-screen-freezes-after-opening-an-application-only
# sudo sh -c 'echo evdi >> /etc/modules'
# sudo sh -c 'echo "options evdi initial_device_count=2" > /etc/modprobe.d/evdi.conf'

## reboot, adjust settings and display, mouse speed, taskbars
## adjust boot timeout /etc/default/grub, do update-grub

## install noip2 based on https://www.noip.com/support/knowledgebase/installing-the-linux-dynamic-update-client-on-ubuntu/
# cd $HOME/Downloads
# wget http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz
# tar xf noip-duc-linux.tar.gz
# cd noip-2.1.9-1
# make
# sudo make install
## add noip2 to default startup using systemd->crontab
# sudo crontab -eu root
## add the line "@reboot /usr/local/bin/noip2"

## install virtualbox https://www.virtualbox.org/wiki/Linux_Downloads
# sudo sh -c 'echo "deb https://download.virtualbox.org/virtualbox/debian artful contrib" >> /etc/apt/sources.list'
# wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
# sudo apt-get update
# sudo apt-get install virtualbox-5.2

## install NoMachine dpkg -i ....deb

## install variety
# sudo add-apt-repository ppa:peterlevi/ppa
# sudo apt-get update
# sudo apt-get install variety variety-slideshow

## link data drive to home

## install sogou pinyin
## sudo dpkg -i *.deb
## sudo apt install -f
## reboot and then config sogou. add sogou in the input method.

## llvm https://apt.llvm.org/
## add following two lines to /etc/apt/sources.list
## deb http://apt.llvm.org/artful/ llvm-toolchain-artful main
## deb-src http://apt.llvm.org/artful/ llvm-toolchain-artful main
## install the signature:
# wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -
# sudo apt update
# sudo apt-get install clang-5.0 clang-5.0-doc libclang-common-5.0-dev libclang-5.0-dev libclang1-5.0 libclang1-5.0-dbg libllvm-5.0-ocaml-dev libllvm5.0 libllvm5.0-dbg lldb-5.0 llvm-5.0 llvm-5.0-dev llvm-5.0-doc llvm-5.0-examples llvm-5.0-runtime clang-format-5.0 python-clang-5.0 libfuzzer-5.0-dev

# sudo apt install texlive-full golang

## install texstudio https://www.texstudio.org/

## Install java 8 (for hadoop 3.0.0)
## default path will be /usr/lib/jvm/java-9-oracle
# sudo add-apt-repository ppa:webupd8team/java
# sudo apt update
# sudo apt-get install oracle-java9-installer

## install JabRef
## in order to use JabRef, has to install java8, then set java9 as default and explicit use java8 path for JabRef
## sudo apt install oracle-java9-set-default

## Configure JabRef, set up launcher https://askubuntu.com/a/721387
## Appearance -> javax.swing.plaf.metal.MetalLookAndFeel
## File -> Main file directory -> gdrive.papers

## Allow Pageup/down for history searching http://dqxtech.net/blog/2011-03-06/linux-bash-history-pgup-pgdown
## Uncomment file /etc/inputrc for \e[5~ and \e[6~

# git config --global user.email "you@example.com"
# git config --global user.name "Your Name"
# git config --global core.editor "vim"

# sudo apt install gnome-tweak-tool
