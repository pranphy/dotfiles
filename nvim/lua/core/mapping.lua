local map = vim.keymap.set

map("i","jk","<esc>")
map("v","<space><space>","<esc>")
map("n","<C-J>","<C-W><C-J>")
map("n","<C-K>","<C-W><C-K>")
map("n","<C-H>","<C-W><C-H>")
map("n","<C-L>","<C-W><C-L>")
map("n","<A-v>","<C-W>+")
map("n","<A-b>","<C-W>-")
map("n","<A-m>","<C-W>>")
map("n","<A-n>","<C-W><")
map("v","<","<gv")
map("v",">",">gv")
map("t","<esc>","<C-\\><C-n>")

map("n","<tab>","gt")
map("n","<s-tab>","gT")
--  for quickfix navigation
map("n","<leader>j",":cnext<cr>")
map("n","<leader>k",":cprevious<cr>")
map("n","<leader>y",'"+y')
map("n","<leader>p",'"+P')
--map("n","<leader>zz",':q<cr>')
map("n","<leader>qq",':q!<cr>')
map("n","<leader>wz",':wq<cr>')

require("core.nepali")

local rev_nepali = require("core.rev-nepali")

vim.keymap.set("i","kj",rev_nepali.toggle)
vim.keymap.set("i","पव",rev_nepali.toggle)
