require("plugin.loader").load_plugins({
  "nvim-lua/plenary.nvim",
  {"neovim/nvim-lspconfig",cfg={enable=true,path="plugin.nvim-lsp"}},
  {"nvim-treesitter/nvim-treesitter", dependencies={"nvim-treesitter/nvim-treesitter-textobjects"},
    cfg={path="plugin.treesitter"}
  },
  {"folke/tokyonight.nvim",cfg={path="plugin.tokyonight"}},
  {"nvim-telescope/telescope.nvim", dependencies= {"nvim-telescope/telescope-bibtex.nvim"},
    cfg={enable=true,path="plugin.telescope"}
  },
  {"lewis6991/gitsigns.nvim",cfg={path="plugin.gitsigns"}},
  {"sindrets/diffview.nvim",cfg={path="plugin.diffview"}},
  {"TimUntersberger/neogit",cfg={path="plugin.neogit"}},
  {"nvim-lualine/lualine.nvim",cfg={path="plugin.lualine"}},
  {"nvim-neo-tree/neo-tree.nvim", dependencies = { "MunifTanjim/nui.nvim", }, cfg={path="plugin.neo-tree"}},
  {"L3MON4D3/LuaSnip" , cfg={path="plugin.luasnip"} },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline" },
    cfg={enable=true,path="plugin.cmp-nvim"},
  },
  {"lervag/vimtex",cfg={path="plugin.vimtex"}},
  --"renerocksai/telekasten.nvim"},
  { "toppair/peek.nvim",event = {"VeryLazy"}, build = 'deno task --quiet build:fast', cfg={path='plugin.peek-nvim'}},
  --{"axvr/zepl.vim"},
  --{"JuliaEditorSupport/julia-vim"},
  --{'kaarmu/typst.vim', ft = {'typst'}},
  --{'mfussenegger/nvim-dap'}
})

