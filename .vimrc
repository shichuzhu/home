" For VIM
filetype on
filetype plugin on
filetype indent on
" End For VIM

set hlsearch
set sw=4
set ts=4
set bs=2
set ai
set nu
set ru
set wildmenu
set background=dark
set mouse=a
syntax on

" Save in and remains in insert mode
inoremap <F1> <C-o>:w<cr>
nnoremap <F1> :w<cr>

map<F2> :call AddCommentSHELL()<cr>
func AddCommentSHELL()
	if (getline('.')[0] == '#')
		normal ^x
	else
		:s/^/#/
	endif
endfunc

map<F3> :call AddCommentFORTRAN()<cr>
func AddCommentFORTRAN()
	if (getline('.')[0] == '!')
		normal ^x
	else
		normal 0i!
	endif
endfunc

map<F4> :call AddCommentMATLAB()<cr>
func AddCommentMATLAB()
	if (getline('.')[0] == '%')
		normal ^x
	else
		normal 0i%
	endif
endfunc

au BufRead,BufNewFile *.ncl set filetype=ncl
au! Syntax newlang source $VIM/ncl.vim 

" For matlab
source $VIMRUNTIME/macros/matchit.vim
autocmd BufEnter *.m    compiler mlint 
