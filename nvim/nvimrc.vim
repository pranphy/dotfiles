set inccommand=split
set laststatus=3
set cmdheight=0
set nomore

tnoremap jk <C-\><C-n>
tnoremap jK <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

runtime plugin-config/telescope.lua
runtime plugin-config/treesitter.lua
runtime plugin-config/cmp-nvim.lua
runtime plugin-config/luasnip.lua
runtime plugin-config/nvim-lsp.lua

lua require("plugin.nvim-tree")
