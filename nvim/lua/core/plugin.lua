-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Post-install/update hook with neovim command
  use {'nvim-lua/plenary.nvim'}
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { "nvim-telescope/telescope-bibtex.nvim",
    config = function () require"telescope".load_extension("bibtex") end,
  }

  -- Use dependency and run lua function after load
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }, }
  use { 'nvim-tree/nvim-tree.lua', tag = 'nightly', requires = { 'nvim-tree/nvim-web-devicons', }, }
  use "L3MON4D3/LuaSnip"
  use 'lervag/vimtex'

end)
