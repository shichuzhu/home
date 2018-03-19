#####!/bin/bash
# to use the function, source it in the .bashrc by
# . $HOME/workspace/bin/workingWithWorkspace.sh
# cscd [ course number [ project name ]]
# change directory to destination in the workspace.
# project name supports wildcard
# default to gmail root directory to run a drive pull/push sync

# function cscd {
cscd() {
	local output
	local outstate
	# local has to be different line, otherwise $? is affected.
	# https://stackoverflow.com/questions/12451278/bash-capture-stdout-to-a-variable-but-still-display-it-in-the-console
	# https://www.zsh.org/mla/users/2011/msg00161.html [] works like a command, need to quote '==' for zsh
	if [ "$FLAG_ZSH" "==" "True" ]; then # zsh starts pipestatus with 1
		output=$(python3 $HOME/workspace/bin/cscd.py "$@" | tee /dev/tty; exit ${pipestatus[1]})
	else # bash starts pipestatus with 0, and it's also upper-case
		output=$(python3 $HOME/workspace/bin/cscd.py "$@" | tee /dev/tty; exit ${PIPESTATUS[0]})
	fi
	outstate=$?
	# Get exit status of process that's piped to another -- Google
	if [ $outstate -eq 1 ]; then
		cd $output
	elif [ $outstate -eq 2 ]; then 
		$output
	fi
}
