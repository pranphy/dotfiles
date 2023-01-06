-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use "neovim/nvim-lspconfig"

  use "nvim-telescope/telescope.nvim"
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "nvim-telescope/telescope-bibtex.nvim",
    config = function () require"telescope".load_extension("bibtex") end,
  }


  -- Use dependency and run lua function after load
  use "nvim-tree/nvim-web-devicons"
  use "lewis6991/gitsigns.nvim"
  use "sindrets/diffview.nvim"
  use "TimUntersberger/neogit"

  use { "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons", opt = true }, }
  use { "nvim-tree/nvim-tree.lua",  requires = { "nvim-tree/nvim-web-devicons", }, }
  use "L3MON4D3/LuaSnip"
  use "lervag/vimtex"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"

  use "renerocksai/telekasten.nvim"

  use "axvr/zepl.vim"
  use "Mofiqul/dracula.nvim"
  use "ellisonleao/gruvbox.nvim"
end)

