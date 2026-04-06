local fff = require("fff")
fff.setup({
  -- UI dimensions and appearance
  width = 0.8,          -- Window width as fraction of screen
  height = 0.8,         -- Window height as fraction of screen
  prompt = '🪿 ',       -- Input prompt symbol
  preview = {
      enabled = true,
      width = 0.5,
      max_lines = 100,
      max_size = 1024 * 1024, -- 1MB
  },
  title = 'FFF Files',  -- Window title
  max_results = 60,     -- Maximum search results to display
  max_threads = 4,      -- Maximum threads for fuzzy search

  keymaps = {
    close = '<Esc>',
    select = '<CR>',
    select_split = '<C-s>',
    select_vsplit = '<C-v>',
    select_tab = '<C-t>',
    -- Multiple bindings supported
    move_up = { 'j', '<C-p>' },
    move_down = { 'k', '<C-n>' },
    preview_scroll_up = '<C-u>',
    preview_scroll_down = '<C-d>',
  },

  -- Highlight groups
  hl = {
    border = 'FloatBorder',
    normal = 'Normal',
    cursor = 'CursorLine',
    matched = 'IncSearch',
    title = 'Title',
    prompt = 'Question',
    active_file = 'Visual',
    frecency = 'Number',
    debug = 'Comment',
  },

  -- Debug options
  debug = {
    show_scores = false,  -- Toggle with F2 or :FFFDebug
  },
})

vim.keymap.set("n","<leader>ff", function() fff.find_files() end) -- fff.find_files() -- Find files in current directory
--vim.keymap.set("n","<leader>fg", fff.find_in_git_root) -- fff.find_in_git_root() -- Find files in the current git repository
--vim.keymap.set("n","<leader>fr", fff.scan_files) -- fff.scan_files() -- Trigger rescan of files in the current directory
---fff.refresh_git_status() -- Refresh git status for the active file lock
vim.keymap.set("n","<leader>fd", function() fff.find_files_in_dir("~/.config/nvim") end) -- fff.find_files_in_dir(path) -- Find files in a specific directory
--fff.change_indexing_directory(new_path) -- Change the base directory for the file picker
