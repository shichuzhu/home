export EDITOR='vim'

# TODO Add workstation domain name here.
DESKTOP={{DESKTOP_DOMAIN}}
WORKPLACE=$DESKTOP

# negate effect of the common-aliases plugin
unalias rm

source /usr/share/zsh/vendor-completions/_tmuxinator

alias szdone='xmessage -center "Done"'

alias exp='ssh -tY $WORKPLACE "tmuxinator s exp"'
