
vim.keymap.set("i","jk","<esc>")
vim.keymap.set("v","<space><space>","<esc>")
vim.keymap.set("n","<C-J>","<C-W><C-J>")
vim.keymap.set("n","<C-K>","<C-W><C-K>")
vim.keymap.set("n","<C-H>","<C-W><C-H>")
vim.keymap.set("n","<C-L>","<C-W><C-L>")
vim.keymap.set("n","<A-v>","<C-W>+")
vim.keymap.set("n","<A-b>","<C-W>-")
vim.keymap.set("n","<A-m>","<C-W>>")
vim.keymap.set("n","<A-n>","<C-W><")
vim.keymap.set("v","<","<gv")
vim.keymap.set("v",">",">gv")
vim.keymap.set("t","<esc>","<C-\\><C-n>")
vim.keymap.set("t","jk","<C-\\><C-n>")

vim.keymap.set("n","<tab>","gt")
vim.keymap.set("n","<s-tab>","gT")
--  for quickfix navigation
vim.keymap.set("n","<leader>j",":cnext<cr>")
vim.keymap.set("n","<leader>k",":cprevious<cr>")

vim.keymap.set("v","<leader>y",'"+y')
vim.keymap.set("n","<leader>y",'"+yg_')
vim.keymap.set("n","<leader>p",'"+P')
--vim.keymap.set("n","<leader>zz",':q<cr>')
vim.keymap.set("n","<leader>qq",':q!<cr>')
vim.keymap.set("n","<leader>wz",':wq<cr>')

-- make a backup copy of line
vim.keymap.set("n","yc","yygccp",{remap=true})

require("core.nepali")

local rev_nepali = require("core.rev-nepali")

vim.keymap.set("i","kj",rev_nepali.toggle)
vim.keymap.set("i","पव",rev_nepali.toggle)
