--ft=lua
local function lazy_manager()
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
end

local setup_plugins = function(installen)
  lazy_manager()
  require("lazy").setup(installen);
end

function file_exists(name)
  local f=io.open(name,"r")
  if f ~= nil then io.close(f) return true else return false end
end

local load_plugins = function(names)
  for k,plugin in ipairs(names) do
    local plugpath = ''
    if type(plugin) == 'string' then plugin = {plugin} end
    if  plugin.cfg ~= nil  then
      if plugin.cfg.enable == nil or plugin.cfg.enable == true then
        plugpath = plugin.cfg.path
      end
    else
      if (plugin[1] ~= nil) then
          local plugid = string.match(plugin[1],"/(.*)")
          local alts = {plugid, plugid:gsub(".nvim",""),plugid:gsub(".vim",""),plugid:gsub("nvim--",""), plugid:gsub(".cmp","") }
          for k,v in pairs(alts) do
            local configdir = vim.env.MYVIMRC:match("(.*/)")
            local filename = configdir.."lua/plugin/"..v..".lua"

            if file_exists(filename) then
              plugpath = "plugin."..v
              break
            end
          end
       end
    end
    if plugpath ~= '' then
      plugin["config"] = function(_,opt)
        require(plugpath)
      end
      names[k] = plugin
    end
  end
  setup_plugins(names)
end


load_plugins({
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
    --"numToStr/FTerm.nvim",
    --{"epwalsh/obsidian.nvim", version = "*", lazy = true, ft = "markdown"},
    {"toppair/peek.nvim", event = {"VeryLazy"}, build = 'deno task --quiet build:fast', },
    --{"nvim-telescope/telescope.nvim", dependencies= {"nvim-telescope/telescope-file-browser.nvim","nvim-telescope/telescope-bibtex.nvim", "nvim-lua/plenary.nvim"}},
    "folke/snacks.nvim",
    {"OXY2DEV/markview.nvim", lazy = false},
    "hat0uma/csvview.nvim",
    "cameron-wags/rainbow_csv.nvim",
    "HakonHarnes/img-clip.nvim",
    --"Saghen/blink.cmp",

})

