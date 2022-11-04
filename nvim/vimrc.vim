"
" Thought for a while about what to put here
" and ended up writing this instead.
"
"
set nocompatible
filetype off

call plug#begin('~/.local/share/nvim/bundle/')
    Plug 'Valloric/YouCompleteMe'
    Plug 'scrooloose/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'lervag/vimtex'
    Plug 'KeitaNakamura/tex-conceal.vim'
    Plug 'SirVer/ultisnips'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'
    Plug 'JuliaEditorSupport/julia-vim'
    Plug 'ervandew/supertab'
    Plug 'plasticboy/vim-markdown'
    Plug 'APZelos/blamer.nvim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

    " neovim only
    if has('nvim')
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
        Plug 'neovim/nvim-lspconfig'
        Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
        Plug 'APZelos/blamer.nvim'
        Plug 'dccsillag/magma-nvim', {'do': ':UpdateRemotePlugins'}
    endif
call plug#end()

filetype plugin indent on
syntax on

colorscheme gruvbox
highlight Normal guibg=NONE ctermbg=NONE


set hidden
set tabstop=4
set shiftwidth=4
set expandtab
set cindent
set number
set relativenumber
set modeline
set modelines=5
set nowrap
set breakindent
set clipboard+=unnamedplus
set splitbelow
set splitright
set mouse=n
set foldmethod=indent
set foldlevel=1
set fileformat=unix
set nohlsearch
set incsearch
set guifont=Iosevka\ Term

let mapleader=' '


inoremap jk <esc>
inoremap jK <esc>
inoremap Jk <esc>
inoremap KJ <esc>
inoremap JK <esc>

nnoremap <A-v> <C-w>+
nnoremap <A-b> <C-w>-
nnoremap <A-m> <C-w>>
nnoremap <A-n> <C-w><

nnoremap <tab> gt
nnoremap <s-tab> gT

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

vnoremap < <gv
vnoremap > >gv

nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nc :NERDTreeClose<cr>
nnoremap <leader>nm :NERDTreeMirror<cr>


"
"let g:loaded_youcompleteme = 0
let g:ycm_global_ycm_extra_conf='~/.config/nvim/ycm/ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ["jj","<down>"]
let g:ycm_confirm_extra_conf=0
let g:cpp_class_scope_highlight=1

" YCM Support for latex family language
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme
let g:ycm_register_as_syntastic_checker=1


" Vimtex configuration
let g:vimtex_view_method = 'zathura'
"let g:vimtex_syntax_enabled = 0
let g:vimtex_matchparen_enabled=0
"let g:matchup_override_vimtex=1
"let g:matchup_matchparen_deferred=1
let vimtex_fild_enabled=1


set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

let g:SuperTabDefaultCompletionType = 'jj'

" UltiSnips
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsEditSplit="vertical"
"
"

let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_extensions = []
"
runtime plugin-config/functions.vim
runtime plugin-config/fzf.vim
runtime plugin-config/makrdown-conceal.vim
runtime plugin-config/makrdown-preview.vim
runtime plugin-config/nepali-map.vim
runtime plugin-config/vimwiki.vim
runtime plugin-config/vim-fugitive.vim
runtime plugin-config/vim-fugitive.vim




