vim.o.hidden = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.wrap = false
vim.o.breakindent = true
vim.o.conceallevel = 2
vim.o.swapfile = false
--vim.o.signcolumn = 'true'

vim.o.number = true
vim.o.relativenumber = true
vim.o.fileformat = 'unix'
vim.o.foldmethod  = 'syntax'
vim.o.hlsearch = false
vim.o.winborder = 'rounded'

vim.o.inccommand = 'split'
vim.o.laststatus = 3
vim.o.cmdheight = 0

vim.g.mapleader = ' '

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
--vim.opt.signcolumn = "yes"

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>d', '"+d')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>v', ':e $MYVIMRC<CR>')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>s', ':e #<CR>')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>S', ':sf #<CR>')

vim.pack.add({
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	--{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
})

--require "mason".setup()
--require "showkeys".setup({ position = "top-right" })
require "mini.pick".setup()
require "oil".setup()

vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")
vim.keymap.set('n', '<leader>e', ":Oil<CR>")
vim.keymap.set('t', '', "")
vim.keymap.set('t', '', "")
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.lsp.enable({ "lua_ls","cpp"})
vim.api.nvim_create_autocmd("FileType", { pattern = "cpp", callback = function() vim.treesitter.start() end, })
--vim.treesitter.start()
--require('nvim-treesitter.configs').setup({ auto_install = true, highlight = { enable = true, }, })

-- colors
--require "tokyonight".setup({ transparent = true })
vim.cmd("colorscheme tokyonight")
vim.cmd(":hi statusline guibg=NONE")

-- snippets
local ls = require("luasnip")
ls.setup({ enable_autosnippets = true })
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lusnip/" })
vim.keymap.set({ "i" }, "<C-e>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-K>", function() ls.jump(-1) end, { silent = true })
