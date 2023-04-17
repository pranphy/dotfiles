-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use "neovim/nvim-lspconfig"

  use "nvim-telescope/telescope.nvim"
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/nvim-treesitter-textobjects"
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
  use "folke/tokyonight.nvim"
  use "ekickx/clipboard-image.nvim"
  use "JuliaEditorSupport/julia-vim"
  use { "toppair/peek.nvim", run = 'deno task --quiet build:fast',
    config = {
      require('peek').setup({
        auto_load = true,         -- whether to automatically load preview when
        -- entering another markdown buffer
        close_on_bdelete = true,  -- close preview window on buffer delete

        syntax = true,            -- enable syntax highlighting, affects performance

        theme = 'dark',           -- 'dark' or 'light'

        update_on_change = true,

        -- relevant if update_on_change is true
        throttle_at = 200000,     -- start throttling when file exceeds this
        -- amount of bytes in size
        throttle_time = 'auto',   -- minimum amount of time in milliseconds
        -- that has to pass before starting new render
      })
    }
  }
end)

