require("plugin.loader").load_plugins({
    "folke/tokyonight.nvim",
    {"nvim-treesitter/nvim-treesitter", dependencies={"nvim-treesitter/nvim-treesitter-textobjects"}},
    "neovim/nvim-lspconfig",
    "nvim-lualine/lualine.nvim",
    {"L3MON4D3/LuaSnip" , event="InsertEnter", cfg={path="plugin.luasnip"}},
    {"hrsh7th/nvim-cmp", event = "InsertEnter", dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline","hrsh7th/cmp-calc", "hrsh7th/cmp-nvim-lsp-signature-help" }, },
    "folke/zen-mode.nvim",
    {"NeogitOrg/neogit", dependencies = { "nvim-lua/plenary.nvim",  }},
    "lewis6991/gitsigns.nvim",
    "sindrets/diffview.nvim",
    "pranphy/nevl.nvim",
    "ray-x/lsp_signature.nvim",
    --#   {"mfussenegger/nvim-dap", cfg={path="plugin.nvim-dap"}},
    --#   {"rcarriga/nvim-dap-ui", dependencies = {"theHamsta/nvim-dap-virtual-text","nvim-neotest/nvim-nio"}},
    "Exafunction/codeium.nvim",

    --{"JuliaEditorSupport/julia-vim",ft={'julia'}},
    {"lervag/vimtex", ft="tex"},
    {'kaarmu/typst.vim', ft = {'typst'}},
    "numToStr/FTerm.nvim",
    {"epwalsh/obsidian.nvim", version = "*", lazy = true, ft = "markdown"},
    {"toppair/peek.nvim", event = {"VeryLazy"}, build = 'deno task --quiet build:fast', },

    "folke/snacks.nvim",
    {dir="~/scratch/nvim/clipboard-image.nvim",cfg={path="plugin.clipboard-image"}},
})

