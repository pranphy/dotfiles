"this is my file
set nocompatible              " be iMproved, required
filetype off                  " required


"alternatively, pass a path where Vundle should install plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'
    Plugin 'Valloric/YouCompleteMe'

    " All of the Plugins are to be added before this
call vundle#end()            " required
filetype plugin indent on    " required


colorscheme monokai 
set guifont=Monaco\ 9


"Setting tab and indentation stuffs
set tabstop=4
set shiftwidth=4
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

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Enable folding
set foldmethod=indent
set foldlevel=99


au BufRead,BufNewFile *.py,*epyw,*.c match BadWhitespace /\s\+$/


if has("gui_running")
  if has("gui_gtk2")
    set guifont=Monaco\ 11
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif
