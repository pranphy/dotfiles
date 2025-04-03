local blink = require("blink.cmp")
local util = require("st.util")

blink.setup({
    keymap = {
        preset = 'none',
        ['<Tab>'] = {'select_next', 'fallback' },
        ['<S-Tab>'] = {'select_prev', 'fallback' },
    },
    --snippets = { preset = 'luasnip' },
    signature = { enabled = true },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    completion = {
        documentation = { auto_show = true },
        list = { selection = {preselect = false, auto_insert = true}},
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'cmdline' },
      providers = {
          path = {
              opts = {
                  trailing_slash = false,
                  label_trailing_slash = true,
              },
          },
      },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = {
        --implementation = "prefer_rust_with_warning",
        implementation = "lua",
        prebuilt_binaries = { force_version = "1.0.0" },
    },
    cmdline = {
        enabled = true,
        sources = util.ternary( vim.fn.getcmdtype == "/" , {"buffer"}, {"cmdline"} ),
        keymap = {
            preset = 'inherit',
        },
        --list = { selection = {preselect = false, auto_insert = true}},
        completion =  {
            menu =  { auto_show = true},
        }
    }
})

