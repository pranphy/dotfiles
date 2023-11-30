require("plugin.loader").load_plugins({
  "folke/tokyonight.nvim",
  "neovim/nvim-lspconfig",
  {"nvim-telescope/telescope.nvim", dependencies= {"nvim-telescope/telescope-bibtex.nvim", "nvim-lua/plenary.nvim"}},
  {"nvim-treesitter/nvim-treesitter", dependencies={"nvim-treesitter/nvim-treesitter-textobjects"}},
  "lewis6991/gitsigns.nvim",
  "sindrets/diffview.nvim",
  "TimUntersberger/neogit",
  "nvim-lualine/lualine.nvim",
  {"nvim-neo-tree/neo-tree.nvim", dependencies = { "MunifTanjim/nui.nvim", }},
  {"L3MON4D3/LuaSnip" , event="InsertEnter", cfg={path="plugin.luasnip"}},
  { "hrsh7th/nvim-cmp", event = "InsertEnter",
    dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline" },
  },
  {"lervag/vimtex", ft="tex"},
  --"renerocksai/telekasten.nvim",
  { "toppair/peek.nvim", event = {"VeryLazy"}, build = 'deno task --quiet build:fast', },
  --{"axvr/zepl.vim"},
  --{"JuliaEditorSupport/julia-vim"},
  --{'kaarmu/typst.vim', ft = {'typst'}},
  --{'mfussenegger/nvim-dap'}
})

