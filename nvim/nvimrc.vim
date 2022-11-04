set inccommand=split
set laststatus=3
set cmdheight=0

tnoremap jk <C-\><C-n>
tnoremap jK <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

runtime plugin-config/lsppy.lua
"runtime plugin-config/telekasten.lua
"runtime plugin-config/telescope.lua
runtime plugin-config/treesitter.lua
runtime plugin-config/magma-nvim.vim
