#.cshrc

setenv F_UFMTENDIAN big
unlimit stacksize

set prompt="%B%{\033[34m%}[%{\033[32m%}%h%{\033[34m%}] %{\033[33m%}%d %w.%D %P %{\033[34m%}[%{\033[32m%}%~%{\033[34m%}]%{\033[31m%}# %{\033[30m%}%b"
#set prompt="%B%{\033[33m%}%d %w.%D %P %{\033[34m%}[%{\033[31m%}%n%{\033[34m%}@%{\033[31m%}%m%{\033[34m%}:%{\033[32m%}%~%{\033[34m%}]\n%{\033[34m%}[%{\033[32m%}%h%{\033[34m%}]%{\033[31m%}# %{\033[30m%}%b"
set autolist

alias rm 	"rm -i"
alias cp 	"cp -i"
alias mv 	"mv -i"
alias ls 	"ls --color=auto"
alias ll	'ls -l --color=auto'
alias la 	"ls -al --color=auto"
alias lt 	"ls -ltr"
alias lth	"ls -lthr"
alias lx	'ls -lX'

set history		= 1000
set savehist	= 500

alias cd 'cd \!*;ls'

bindkey '\e[5~' history-search-backward
bindkey '\e[6~'	history-search-forward	

setenv KEELING szhu28@keeling.earth.illinois.edu
alias kl "ssh -X $KEELING"
alias pfwd "ssh -N -f -L 8103:localhost:8103 $KEELING"
alias klpy "ssh $KEELING 'screen -dm bash -c ipynbhpc'"
