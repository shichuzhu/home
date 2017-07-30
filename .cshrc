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

#-----------------------------------------------------------------
alias vim "vim -X"
setenv PATH "$HOME/usr/local/bin:$PATH"
setenv PATH "$HOME/usr/bin:$PATH"
setenv PATH "$HOME/usr/szhu_setting/bin:$PATH"
setenv PATH "$HOME/usr/local/git/bin:$PATH"
setenv PATH "$HOME/usr/anaconda2/bin:$PATH"
setenv PATH "$HOME/usr/bin/x86_64-pc-linux-gnu:$PATH"
setenv PATH "$HOME/usr/texlive/2016/bin/x86_64-linux:$PATH"
setenv INFOPATH "$HOME/usr/texlive/2016/texmf-dist/doc/info"
setenv MANPATH "$HOME/usr/texlive/2016/texmf-dist/doc/man:$MANPATH"
# For idl 83vm
#setenv PATH "/sw/idl83vm/idl83/bin:$PATH"
#setenv LM_LICENSE_FILE "1703@rosette.atmos.uiuc.edu"
#setenv IDL_LMGRD_LICENSE_FILE 1700@rosette.atmos.uiuc.edu
#alias matlab "matlab -nodesktop"
#module add matlab
module load matlab/0matlab-r2016a	# for matlab 2015 otherwise default 2014a
module load ncl
#alias matlab "matlab -softwareopengl"
#setenv LIBGL_ALWAYS_INDIRECT 1
#module load matlab#/matlab-r2014a

setenv DATA /data/mcfarq/a/szhu28/research/HIWC/data/fulldataDarwin
#alias vim "vim --servername vimtex"
#alias hw 'vim *.tex'
alias evince "evince-previewer"
# auto delete $HOME/tmp/ files that are not accessed within 15 days.
#find $HOME/tmp/* -mtime +15 -exec rm -rf {} \;

# For ncplot to work, need to add some modules
module add gnu/netcdf4-4.2-gnu-4.4.6
module add gnu/hdf5-1.8.9-gnu-4.4.6
module add gnu/szip-2.1-gnu-4.4.6
module add gnu/udunits-2.1.24-gnu-4.4.6
#module add idl/idl7
module add idl/idl8
#module add idl/idl83vm
#module add idl/idl801

#setenv LD_LIBRARY_PATH $HOME/usr/local/lib:$LD_LIBRARY_PATH
setenv HIWC /data/mcfarq/a/szhu28/research/HIWC/10_150901Wholeflight/src/analysis
setenv C_INCLUDE_PATH /data/keeling/a/szhu28/usr/include:/data/keeling/a/szhu28/usr/local/include
setenv CPLUS_INCLUDE_PATH /data/keeling/a/szhu28/usr/include:/data/keeling/a/szhu28/usr/local/include
setenv SCAMP /data/atms510/a/SCAMP/SCAMP/IOP1/MPS_data/26_April_2017

alias notebook "jupyter notebook --no-browser --port=8103"
setenv IPYNB_PORT 8103
setenv IPYNB_MINUTES "1440"
setenv IPYNB_QSUB_TEMPLATE "qlogin -n 1 -mem 32G"
setenv IPYNB_NOTEBOOK_TEMPLATE 'bash -c "source /data/keeling/a/szhu28/.bashrc; jupyter notebook --port=%s --no-browser --ip=127.0.0.1 "'

#GO LANG for googledrive odeke
setenv PATH "$HOME/usr/local/go/bin:$PATH"
setenv GOROOT "$HOME/usr/local/go"
setenv GOPATH "$HOME/usr/local"
setenv PYTHONPATH "$HOME/usr/szhu_setting/python"

alias ncdump /sw/netcdf4-4.2-gnu-4.4.6/bin/ncdump
