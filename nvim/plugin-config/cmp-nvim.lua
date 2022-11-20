local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
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

local cmp = require'cmp'

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
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = {
        -- ... Your other configuration ...
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif snippy.can_expand_or_advance() then
                snippy.expand_or_advance()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif snippy.can_jump(-1) then
                snippy.previous()
            else
                fallback()
            end
        end, { "i", "s" }),

    },
        -- ... Your other configuration ...
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'ultisnips' }, -- For ultisnips users.
         { name = 'luasnip' }, -- For ultisnips users.
        { name = 'path', option = { trailing_slash = false }, },
    }, {
        { name = 'buffer' },
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

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = 'buffer' } }
})
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    -- mapping = cmp.mapping.preset.cmdline(),
    mapping = {                
         ['<CR>'] = cmp.mapping(cmp.mapping.confirm({ select = false }), { 'i', 'c' }) -- false works basically
         -- ['<CR>'] = cmp.mapping.confirm({ select = true }) -- neither works
    },
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- % Mapping for ulti snips that worked
-- %
-- %        ["<Tab>"] = cmp.mapping({
-- %            c = function()
-- %                if cmp.visible() then
-- %                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
-- %                else
-- %                    cmp.complete()
-- %                end
-- %            end,
-- %            i = function(fallback)
-- %                if cmp.visible() then
-- %                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
-- %                elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
-- %                    vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
-- %                else
-- %                    fallback()
-- %                end
-- %            end,
-- %            s = function(fallback)
-- %                if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
-- %                    vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
-- %                else
-- %                    fallback()
-- %                end
-- %            end
-- %        }),
-- %        ["<S-Tab>"] = cmp.mapping({
-- %            c = function()
-- %                if cmp.visible() then
-- %                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
-- %                else
-- %                    cmp.complete()
-- %                end
-- %            end,
-- %            i = function(fallback)
-- %                if cmp.visible() then
-- %                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
-- %                elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
-- %                    return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
-- %                else
-- %                    fallback()
-- %                end
-- %            end,
-- %            s = function(fallback)
-- %                if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
-- %                    return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
-- %                else
-- %                    fallback()
-- %                end
-- %            end
-- %        }),
-- %        ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
-- %        ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
-- %        ['<C-n>'] = cmp.mapping({
-- %            c = function()
-- %                if cmp.visible() then
-- %                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
-- %                else
-- %                    vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
-- %                end
-- %            end,
-- %            i = function(fallback)
-- %                if cmp.visible() then
-- %                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
-- %                else
-- %                    fallback()
-- %                end
-- %            end
-- %        }),
-- %        ['<C-p>'] = cmp.mapping({
-- %            c = function()
-- %                if cmp.visible() then
-- %                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
-- %                else
-- %                    vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
-- %                end
-- %            end,
-- %            i = function(fallback)
-- %                if cmp.visible() then
-- %                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
-- %                else
-- %                    fallback()
-- %                end
-- %            end
-- %        }),
-- %        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
-- %        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
-- %        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
-- %        ['<C-e>'] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
-- %        ['<CR>'] = cmp.mapping({
-- %            i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
-- %            c = function(fallback)
-- %                if cmp.visible() then
-- %                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
-- %                else
-- %                    fallback()
-- %                end
-- %            end
-- %        }),
-- %
