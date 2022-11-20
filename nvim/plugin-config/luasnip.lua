

vim.cmd[[
imap <silent><expr> jj luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : 'jj' 
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> jj <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
]]


require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/luasnip/"})
vim.cmd[[
command! LuaSnipEdit :lua require("luasnip.loaders").edit_snippet_files()
]]



