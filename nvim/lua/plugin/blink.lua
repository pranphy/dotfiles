local blink = require("blink.cmp")
--blink.setup()

function latex_symb(ctx)
    local ft = vim.api.nvim_get_option_value("filetype", {
		scope = "local",
		buf = ctx.bufnr,
	})
	if ft == "tex" then
		return true
	end
	return false
end


blink.setup({

    --keymap = { preset = 'default' },

    keymap = {
        --preset = 'default',
        ['<Tab>'] = { 'select_next' },
        ['<S-Tab>'] = {'select_prev' },
    },
    completion = {
        menu = {
            draw = {
                columns = { { "kind_icon", }, { "label", "label_description", gap = 5 }, },
                treesitter = { 'lsp' },
            },
            --border = "",
        },
        list = { selection = { preselect = false, auto_insert = true }, cycle = { from_top = true} },
        documentation = { auto_show = true, window = { border = 'single'}},
    },

    --snippets = { preset = 'luasnip' },

    appearance = {
        nerd_font_variant = 'mono'
    },

    sources = {
        default = { 'lsp', 'path', 'buffer', 'cmdline', 'latex' },
        providers = {
            path = {
                opts = {
                    trailing_slash = false,
                    label_trailing_slash = true,
                },
            },
            latex = {
                name="Latex",
                module="blink-cmp-latex",
                opts = { insert_command = latex_symb },
            },
        },
    },
    cmdline = {
        --keymap = { preset = 'select_next', },
        keymap = {['<Tab>'] = { 'show', 'select_next', 'fallback' } },
        --keymap = {['<Tab>'] = { 'show_and_select_next', 'fallback' } },
        --keymap = {['<Tab>'] = { 'show_and_insert_or_accept_single', 'select_next' }, },
        sources = function()
            local type = vim.fn.getcmdtype()
            if type == '/' or type== '?' then return {'buffer'} end
            if type == ':' then return { 'path','cmdline' } end
            return {}
        end,
        completion = {menu = {auto_show = true},list = { selection = { preselect = false, auto_insert = true}}},
        --completion = { menu = { auto_show = true } },
        --list = { selection = { preselect = false, auto_insert = true } },
    },
    signature = { enabled = true, window = { border = 'rounded' } },

    --fuzzy = { implementation = "prefer_rust_with_warning" }
    --},
    --opts_extend = { "sources.default" }
})

