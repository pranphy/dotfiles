-- ft: lua
local ls = require("luasnip")


require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/luasnip/"})

ls.config.set_config({
    history = true, --keep around last snippet.
    updateevents = "TextChanged, TextChangedI"
})

vim.cmd([[
imap <silent><expr> <A-space> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<A-space>'
inoremap <silent> <A-shift-space> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>


imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

"command! LuaSnipEdit :lua require("luasnip.loaders").edit_snippet_files()
command! LuaSnipEdit :lua require("st.telescope").edit_snippets()
]])

ls.config.set_config({history=true,enable_autosnippets=true})

