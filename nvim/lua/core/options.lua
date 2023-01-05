local set = vim.opt


set.hidden = true

set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true
set.splitright = true
set.splitbelow = true
set.wrap = false
set.breakindent = true

set.number = true
set.relativenumber = true
set.fileformat = 'unix'
set.foldmethod  = 'syntax'
set.hlsearch = false

set.inccommand = 'split'
set.laststatus = 3
set.cmdheight = 0

vim.g.mapleader = ' '
-- vim.g.colors_name = 'gruvbox'

vim.cmd[[
colorscheme dracula
highlight SignColumn guibg=NONE
highlight Normal guibg=NONE ctermbg=NONE
highlight VertSplit guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
]]

