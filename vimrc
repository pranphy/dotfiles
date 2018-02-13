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
    " BEtter highlighting for c++
    Plugin 'octol/vim-cpp-enhanced-highlight' 

    "Now status line also
    Plugin 'vim-airline/vim-airline'
    
    " Let the latex begin
    Plugin 'lervag/vimtex'

    " All of the Plugins are to be added before this
call vundle#end()            " required
filetype plugin indent on    " required
"Vundle bro, thanks for the job.

" Monokai has been my favourite for some time now
" alternatives are always welcome though
colorscheme molokai 


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

"Terminal Navigations
"The esc to go to bormal mode
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Enable dragging
set mouse=n


vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>"+*+P


"Enable folding
set foldmethod=indent
set foldlevel=99

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Monaco\ 11
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  else
      set guifont=Monaco\ 11
  endif
else
    set guifont=Monaco\ 10
endif

" force LF in line ending
set fileformat=unix
set fileformats=unix,dos


"let &colorcolumn=join(range(81,999),",")
"highlight ColorColumn ctermbg=235 guibg=#2c2d27
"let &colorcolumn="80,".join(range(120,999),",")

" YCM support for C Language family
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:cpp_class_scope_highlight=1

" YCM Support for latex family language
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme


