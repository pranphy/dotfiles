-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use "neovim/nvim-lspconfig"
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/nvim-treesitter-textobjects"

  use "nvim-telescope/telescope.nvim"
  use { "nvim-telescope/telescope-bibtex.nvim",
    config = function () require"telescope".load_extension("bibtex") end,
  }


  -- Use dependency and run lua function after load
  use "lewis6991/gitsigns.nvim"
  use "sindrets/diffview.nvim"
  use "TimUntersberger/neogit"

  use "nvim-lualine/lualine.nvim"
  use "MunifTanjim/nui.nvim"
  use "nvim-neo-tree/neo-tree.nvim"
  use "L3MON4D3/LuaSnip"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"

  use "lervag/vimtex"
  use "renerocksai/telekasten.nvim"

  use "axvr/zepl.vim"
  use "Mofiqul/dracula.nvim"
  use "ellisonleao/gruvbox.nvim"
  use "folke/tokyonight.nvim"
  use "ekickx/clipboard-image.nvim"
  use "JuliaEditorSupport/julia-vim"
  use { "toppair/peek.nvim", run = 'deno task --quiet build:fast', }
  use {'kaarmu/typst.vim', ft = {'typst'}}

  end)

