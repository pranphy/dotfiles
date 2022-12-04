local set = vim.opt


set.hidden = true

set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.splitright = true
set.splitbelow = true

set.number = true
set.relativenumber = true
set.fileformat = 'unix'
set.foldmethod  = 'indent'

set.inccommand = 'split'
set.laststatus = 3
set.cmdheight = 0

vim.g.mapleader = ' '
-- vim.g.colors_name = 'gruvbox'

vim.cmd[[
colorscheme gruvbox
highlight Normal guibg=NONE ctermbg=NONE
]]
