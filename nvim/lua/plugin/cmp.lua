-- ft: lua
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


local kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = ""
}

local cmp = require("cmp")

local luasnip = require("luasnip")

--local cmp_im = require('cmp_im')
--cmp_im.setup{
--  -- Enable/Disable IM
--  enable = false,
--  -- IM keyword pattern
--  keyword = [[\l\+]],
--  -- IM tables path array
--  tables = {'/home/pranphy/.Rough/nvim/neptidc.txt'},
--  trigger = {' '},
--  -- Function to format IM-key and IM-tex for completion display
--  format = function(key, text) return vim.fn.printf('%-15S %s', text, key) end,
--  -- Max number entries to show for completion of each table
--  maxn = 8,
--}
--
--vim.keymap.set({'n', 'v', 'c', 'i'}, '<M-;>', function()
--  vim.notify(string.format('IM is %s', cmp_im.toggle() and 'enabled' or 'disabled'))
--end)
--
--cmp.register_source('IM',require('cmp_im').source)



local supertab_mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        elseif has_words_before() then
            cmp.complete()
        else
            fallback()
        end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end, { "i", "s" }),
    --['<Space>'] = cmp.mapping( cmp_im.select(), { 'i' })
}


local cmp_setting = {
    formatting = {
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            -- Source
            vim_item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[LaTeX]",
            })[entry.source.name]
            return vim_item
        end
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = supertab_mapping,
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip', keyword_length=2 },
        { name = 'path', option = { trailing_slash = false }, },
        { name = 'IM' },
        { name = 'calc' },
     --{ name = 'nvim_lsp_signature_help' }
    },{
        { name = 'IM' },
        { name = 'buffer', keyword_length = 5 },
    })
}
cmp.setup(cmp_setting)

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

--cmp.setup.filetype('nepali', {
--    sources = cmp.config.sources({
--        { name = 'IM' },
--    })
--})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
--local cmdline_mapping = supertab_mapping

local cmdline_mapping = {
    ['<CR>'] = cmp.mapping(cmp.mapping.confirm({ select = false }), { 'i', 'c' }) -- false works basically
    -- ['<CR>'] = cmp.mapping.confirm({ select = true }) -- neither works
}

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    --mapping = cmdline_mapping,
    sources = { { name = 'buffer' } }
})
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    --mapping = cmdline_mapping,
    sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } })
})


