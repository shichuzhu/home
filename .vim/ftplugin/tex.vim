" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:
"let g:Tex_ViewRule_dvi = '/usr/bin/evince -w'
let g:Tex_ViewRule_dvi = 'xdvi -notype1fonts'
set winaltkeys=no

:call IMAP('MP','\pp[<++>]{<++>}<++>','tex')
:call IMAP('MD','\dd[<++>]{<++>}<++>','tex')
:call IMAP('RM','\mathrm{<++>}<++>','tex')
:call IMAP('EIG',"\\begin{figure}\<CR>\\centering\<CR>\\fig[<++>]{<++>}\<CR>\\caption{<++>}\<CR>\\label{fig:<++>}\<CR>\\end{figure}\<CR><++>",'tex')
imap <M-j> <Plug>IMAP_JumpForward

"""""""""""""""""""""""""""""""" mapping the Alt Key
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50
let g:Tex_CompileRule_dvi='latex -src-specials -interaction=nonstopmode $*'
:map \ld :execute '!xdvi -editor "vim --servername 'v:servername' --remote +\%l \%f" -sourceposition ' . line(".") . expand("%") . " '" . expand(Tex_GetMainFileName(':r')) . ".dvi' >/dev/null&" <CR><CR>

" map in insert mode
imap <F5> <Esc>:w<CR>:!%:p<CR>
" map in normal mode
map <F5> :w<CR>:!%:p<CR>
