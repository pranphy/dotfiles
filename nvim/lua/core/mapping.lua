local map = vim.keymap.set

map("i","jk","<esc>")
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

map("n","<tab>","gt")
map("n","<s-tab>","gT")

