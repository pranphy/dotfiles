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

    Bundle 'ervandew/supertab'
    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'
    Plugin 'Valloric/YouCompleteMe'
    " NERDTree is the real nerd 
    Plugin 'scrooloose/nerdtree'
    " BEtter highlighting for c++
    Plugin 'octol/vim-cpp-enhanced-highlight' 

    "Now status line also
    Plugin 'vim-airline/vim-airline'
    Plugin 'ctrlpvim/ctrlp.vim'
    
    " Let the latex begin
    Plugin 'lervag/vimtex'


    " The first time I used computer to type I had this in mind
    Plugin 'SirVer/ultisnips'

    " Vim fugutive
    Plugin 'tpope/vim-fugitive'
    Plugin 'hsanson/vim-android'



    " All of the Plugins are to be added before this
call vundle#end()            " required
filetype plugin indent on    " required
"Vundle bro, thanks for the job.

" Monokai has been my favourite for some time now
" alternatives are always welcome though
"colorscheme monokai  " kinda sucks for latex


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
set clipboard=unnamedplus


"The default right and down split
set splitbelow
set splitright

"split window navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" retain selection
vnoremap < <gv
vnoremap > >gv


"Terminal Navigations
"The esc to go to normal mode
if has ('nvim')
    let g:python3_host_prog = '/usr/local/bin/python3.7'
    tnoremap jk <C-\><C-n>
    tnoremap jK <C-\><C-n>
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-l> <C-\><C-n><C-w>l
endif


" Enable dragging
set mouse=n


"Enable folding
set foldmethod=indent
set foldlevel=1

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
"
"

" YCM support for C Language family
"
"let g:loaded_youcompleteme = 1
let g:ycm_global_ycm_extra_conf='~/.config/nvim/ycm/ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ["jj","<down>"]
let g:cpp_class_scope_highlight=1

" YCM Support for latex family language
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme
let g:ycm_register_as_syntastic_checker=1

"let g:loaded_youcompleteme = 1

" Vimtex configuration
let g:vimtex_view_method = 'zathura'


" Now make ulti snippet work
" Trigger configuration. 
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"


"inoremap <space><tab> <c-j>
"
"let g:UltiSnipsSnippetDirectories=["~/.config/nvim/UltiSnips","UltiSnips"]
"
":UltiSnipsEdit to split vertically.
 let g:UltiSnipsEditSplit="vertical"
"
"
"

inoremap jk <esc>
inoremap jK <esc>
inoremap Jk <esc>
inoremap KJ <esc>
inoremap JK <esc>
inoremap <esc> <nop>

nnoremap <A-v> <C-w>+ 
nnoremap <A-b> <C-w>-
nnoremap <A-m> <C-w>>
nnoremap <A-n> <C-w><



nnoremap <space> :nohl<cr>
nnoremap ev :vsplit $MYVIMRC<cr>
nnoremap sv :source $MYVIMRC<cr>


" Crazhy thing to do
" air-line
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
let g:airline_extensions = []

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
