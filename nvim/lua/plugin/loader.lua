--ft=lua
local M = {}
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

M.load_plugins = function(names)
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
          local alts = {plugid, plugid:gsub(".nvim",""),plugid:gsub(".vim",""),plugid:gsub("nvim--","") }
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

return M

