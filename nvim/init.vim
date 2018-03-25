" 
" Thought for a while about what to put here
" and ended up writing this instead.
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


    " The first time I used computer to type I had this in mind
    Plugin 'SirVer/ultisnips'


    " All of the Plugins are to be added before this
call vundle#end()            " required
filetype plugin indent on    " required
"Vundle bro, thanks for the job.

" Monokai has been my favourite for some time now
" alternatives are always welcome though
colorscheme monokai  " kinda sucks for latex


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
"The esc to go to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l


" Enable dragging
set mouse=n


"Enable folding
set foldmethod=indent
set foldlevel=99

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Monaco\ 9
  elseif has("gui_win32")
    set guifont=Consolas:h9:cANSI
  else
      set guifont=Monaco\ 9
  endif
else
    set guifont=Monaco\ 9
endif

" force LF in line ending
set fileformat=unix
set fileformats=unix,dos


"let &colorcolumn=join(range(81,999),",")
"highlight ColorColumn ctermbg=235 guibg=#2c2d27
"let &colorcolumn="80,".join(range(120,999),",")

" YCM support for C Language family
let g:ycm_global_ycm_extra_conf='~/.config/nvim/ycm/ycm_extra_conf.py'
let g:cpp_class_scope_highlight=1

" YCM Support for latex family language
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

" Vimtex configuration
let g:vimtex_view_method = 'zathura'


" Now make ulti snippet work
" Trigger configuration. 
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

"
"let g:UltiSnipsSnippetDirectories=["~/.config/nvim/UltiSnips","UltiSnips"]
"
":UltiSnipsEdit to split vertically.
 let g:UltiSnipsEditSplit="vertical"
"
"
"

inoremap jk <esc>
inoremap Jk <esc>
inoremap jk <esc>
inoremap Jk <esc>
vnoremap jk <esc>
vnoremap Jk <esc>
vnoremap JK <esc>
tnoremap jk <C-\><C-n>
inoremap <esc> <nop>


nnoremap ev :vsplit $MYVIMRC<cr>
nnoremap sv :source $MYVIMRC<cr>

