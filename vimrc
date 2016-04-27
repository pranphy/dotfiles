" 
" "My vim, my control, I want vim to behave the way I want.
" 
"
set nocompatible
filetype off


"Vundle bro, its all your's now, enjoy the stint
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'
    Plugin 'Valloric/YouCompleteMe'
    " NERDTree is the real nerd 
    Plugin 'scrooloose/nerdtree'

    " All of the Plugins are to be added before this
call vundle#end()            " required
filetype plugin indent on    " required
"Vundle bro, thanks for the job.

" Monokai has been my favourite for some time now
" alternatives are always welcome though
colorscheme monokai 


"Setting tab and indentation stuffs
set ts=4
set sw=4
set expandtab
set cindent
syntax on

" To make modelines in file work
set modeline
set modelines=5


"To make smart wrap
set nowrap
set breakindent


"The default right and down split
set splitbelow
set splitright

"split window navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Enable folding
set foldmethod=indent
set foldlevel=99

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Monaco\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  else
      set guifont=Monaco\ 12
  endif
else
    set guifont=Monaco\ 12
endif

" force LF in line ending
set fileformat=unix
set fileformats=unix,dos


" YCM support for C Language family
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
