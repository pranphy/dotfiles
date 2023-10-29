local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
  -- Packer can manage itself
  "wbthomason/packer.nvim",
  "nvim-lua/plenary.nvim",
  "neovim/nvim-lspconfig",
  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/nvim-treesitter-textobjects",

  "nvim-telescope/telescope.nvim",
  { "nvim-telescope/telescope-bibtex.nvim",
    config = function () require"telescope".load_extension("bibtex") end,
  },

  "lewis6991/gitsigns.nvim",
  "sindrets/diffview.nvim",
  "TimUntersberger/neogit",

  "nvim-lualine/lualine.nvim",
  "MunifTanjim/nui.nvim",
  "nvim-neo-tree/neo-tree.nvim",
  "L3MON4D3/LuaSnip",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",

  "lervag/vimtex",
  "renerocksai/telekasten.nvim",

  "axvr/zepl.vim",
  "Mofiqul/dracula.nvim",
  "ellisonleao/gruvbox.nvim",
  "folke/tokyonight.nvim",
  "ekickx/clipboard-image.nvim",
  "JuliaEditorSupport/julia-vim",
  { "toppair/peek.nvim", run = 'deno task --quiet build:fast', },
  {'kaarmu/typst.vim', ft = {'typst'}},
})
