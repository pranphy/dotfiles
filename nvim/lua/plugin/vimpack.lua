-- Utility: check if file exists
local function file_exists(path)
  local f = io.open(path, "r")
  if f then f:close() end
  return f ~= nil
end

-- Detect config file for a plugin
local function find_config(plugin_name)
   --print("Finding config for "..plugin_name);
  local id = plugin_name:match("([^/]+)$")

  --print("The plugin id is "..id);

  if not id then return nil end

  local alts = { id, id:gsub("%.nvim", ""), id:gsub("%.vim", ""), id:gsub("nvim%-", ""), id:gsub("%.cmp", ""), }

  local base = vim.fn.stdpath("config") .. "/lua/plugin/"

  for _, name in ipairs(alts) do
    local file = base .. name .. ".lua"
    if file_exists(file) then
      return "plugin." .. name
    end
  end

  return nil
end

-- Normalize plugin spec for vim.pack
local function normalize(plugin)
  if type(plugin) == "string" then
    if plugin:match("github%.com")  then
        --print("Yes github there ")
        return { src = plugin }
    else
        return { src = "https://github.com/"..plugin }
    end
  else -- this is a table
    -- table with dir → expand and return
    if plugin.dir then
      plugin.dir = vim.fn.expand(plugin.dir)
      return plugin
    end
  end


  -- If we reach here → invalid spec
  error("Invalid plugin spec: missing src or dir: " .. vim.inspect(plugin))
end

-- Main loader
-- Main loader
local function load_plugins(list)

  -- Normalize all plugin specs FIRST
  local normalized = {}
  for i, plugin in ipairs(list) do
    normalized[i] = normalize(plugin)
  end

  -- DEBUG: print normalized specs
  --print("Normalized plugin specs:")
  --for _, p in ipairs(normalized) do
  --  print(vim.inspect(p))
  --end

  -- Register plugins
  vim.pack.add(normalized)

  -- Load plugins
  --vim.pack.load()

  -- Load matching config files
  for _, plugin in ipairs(normalized) do
    local name = plugin.src or plugin.dir
    --print("The name is "..name);
    if type(name) == "string" then
      local cfg = find_config(name)
      --print("The config is "..cfg);
      if cfg then
          --print("Requiring "..cfg);
        require(cfg)
      end
    end
  end
end

load_plugins({
    "folke/tokyonight.nvim",
    "nvim-lualine/lualine.nvim",
    "folke/snacks.nvim",
    "pranphy/nevl.nvim",
    "lervag/vimtex",
    --{ dir="~/repos/pamdex" },
})


vim.api.nvim_create_user_command("Plugin", function(opts)
  local arg = opts.args

  if arg == "update" then
    vim.pack.update()
    print("Plugins updated")
    return
  end

  if arg == "clean" then
    vim.pack.clean()
    print("Unused plugins removed")
    return
  end

  if arg == "status" then
    if vim.pack.status then
      vim.pack.status()
    else
      print("vim.pack.status() not available in this build")
    end
    return
  end

  if arg == "sync" then
    vim.pack.update()
    vim.pack.clean()
    print("Plugins synced")
    return
  end

  print("Usage: :Plugin [update|clean|status|sync]")
end, { nargs = "?" })

vim.api.nvim_create_user_command("Plugin", function(opts)
  local arg = opts.args

  if arg == "update" then
    vim.pack.update()
    print("Plugins updated")
    return
  end

  if arg == "clean" then
    vim.pack.clean()
    print("Unused plugins removed")
    return
  end

  if arg == "status" then
    if vim.pack.status then
      vim.pack.status()
    else
      print("vim.pack.status() not available in this build")
    end
    return
  end

  if arg == "sync" then
    vim.pack.update()
    vim.pack.clean()
    print("Plugins synced")
    return
  end

  print("Usage: :Plugin [update|clean|status|sync]")
end, { nargs = "?" })

