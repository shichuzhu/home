alias odir="xdg-open . &>/dev/null"

export EDITOR="vim"

export KL="szhu28@keeling.earth.illinois.edu"
MY_SSH_FWD_PORT="8103"
MY_SSH_OPTIONS="ssh -N -f -L"
alias pfwd="${MY_SSH_OPTIONS} ${MY_SSH_FWD_PORT}:localhost:${MY_SSH_FWD_PORT} ${KL}"
# The extra "grep -v grep" filter out the command itself. This prevents killing ps itself.
alias upfwd='kill $(ps aux | grep "'"${MY_SSH_OPTIONS}"'" | grep -v grep | awk '"'"'{print $2}'"'"') '
alias pfwdto="${MY_SSH_OPTIONS} ${MY_SSH_FWD_PORT}:localhost:${MY_SSH_FWD_PORT} "

export DT=" -p 49222 shichu@lostandfoundii.ddns.net"
# export VM=" -p 49230 shichu@lostandfoundii.ddns.net"

export PW="stuartzhu@web.illinois.edu"
export EWS=" szhu28@linux.ews.illinois.edu"
export EA=" elaine@salmon.cs.illinois.edu"

szvm() {
	case "$1" in
		help)
			echo acpipowerbutton pause resume poweroff
			;;
		start)
			VBoxManage startvm UbuntuBionic --type headless
			;;
		*)
			VBoxManage controlvm UbuntuBionic $1 --type headless
			;;
	esac
}

# For Haskell stack
export PATH="/home/shichu/.local/bin:$PATH"

# For golang & drive odeke
export GOPATH=$HOME/usr/gopath
export PATH=$GOPATH:$GOPATH/bin:$PATH

# For distinguish zsh/bash in workingWithWorkspace.sh cscd function
# Requires FLAG_ZSH be set in .bashrc or .zshrc
. $HOME/workspace/bin/workingWithWorkspace.sh

# added by Anaconda3 installer
export PATH="/home/shichu/usr/anaconda3/bin:$PATH"
# For jupyter notebook to utilize GPU process.
export BROWSER=google-chrome

# For Apache hadoop / spark
export PATH="/home/shichu/usr/apache/hadoop/bin:/home/shichu/usr/apache/spark/bin:$PATH"

# For src compiled programs (protoc)
export PATH="$HOME/usr/local/bin:$PATH"

# thefuck
eval $(thefuck --alias f)
