--ft=lua
local M = {}
local function lazy_manager()
  local lazypath = vim.fn.stdpath("data") .. "/my_lazy/lazy.nvim"
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
  --print("prepended"..lazypath)
end

local setup_plugins = function(installen)
  lazy_manager()
  require("lazy").setup(installen);
end

M.load_plugins = function(names)
  for k,plugin in ipairs(names) do
    if type(plugin) == 'table' and plugin.cfg ~= nil  then
      if plugin.cfg.enable == nil or plugin.cfg.enable == true then
        plugin["config"] = function(_,opt)
          require(plugin.cfg.path)
        end
        names[k]  = plugin
      end
    end
  end
  setup_plugins(names)
end

return M

