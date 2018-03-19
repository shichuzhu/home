export KL="szhu28@keeling.earth.illinois.edu"
export DT=" -p 49222 shichu@lostandfoundii.ddns.net"
export EWS=" szhu28@linux.ews.illinois.edu"
alias pfwdto="ssh -N -f -L 8103:localhost:8103 "
alias klpy="ssh $KL 'screen -dm bash -c ipynbhpc'"
alias dtpy="ssh $DT 'screen -dm bash -c \"/home/shichu/usr/anaconda3/bin/jupyter notebook --no-browser --port 8103\"'"
alias upfwd='kill $(ps aux | grep "ssh" | awk '"'"'{print $2}'"'"') '
#ssh $DT 'echo $(ps aux |grep "[j]upyter-notebook" |awk '"'"'{print $2}'"'"')'
#The following line generated by s/'/'"'"'/g from the line above
alias udt='ssh $DT '"'"'kill $(ps aux |grep "[j]upyter-notebook" |awk '"'"'"'"'"'"'"'"'{print $2}'"'"'"'"'"'"'"'"')'"'"

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
export PATH="/home/shichu/usr/apache/hadoop-3.0.0/bin:/home/shichu/usr/apache/spark-2.3.0-bin-hadoop2.7/bin:$PATH"
