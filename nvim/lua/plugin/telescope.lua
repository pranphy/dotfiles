-- vim: ft=lua
local telescope = require('telescope')
telescope.setup({
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--no-ignore',
      '--ignore-file=~/.rgignore',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
  },
  pickers = {
    find_files = {
      -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
      find_command = { "rg", "--no-ignore", "--ignore-file=~/.rgignore", "--files", "--hidden", "--glob", "!**/.git/*", "--glob", "!**/.ccls-cache/*" },
    },
  },
   extensions = {
    bibtex = {
      -- Depth for the *.bib file
      depth = 1,
      -- Custom format for citation label
      custom_formats = {},
      -- Format to use for citation label.
      -- Try to match the filetype by default, or use 'plain'
      format = '',
      -- Path to global bibliographies (placed outside of the project)
      global_files = {"/home/pranphy/repos/texmf/bibtex/bib"},
      -- Define the search keys to use in the picker
      search_keys = { 'author', 'year', 'title' },
      -- Template for the formatted citation
      citation_format = '{{author}} ({{year}}), {{title}}.',
      -- Only use initials for the authors first name
      citation_trim_firstname = true,
      -- Max number of authors to write in the formatted citation
      -- following authors will be replaced by "et al."
      citation_max_auth = 2,
      -- Context awareness disabled by default
      context = false,
      -- Fallback to global/directory .bib files if context not found
      -- This setting has no effect if context = false
      context_fallback = true,
      -- Wrapping in the preview window is disabled by default
      wrap = false,
    },
  }
});

-- local bufopts = { noremap=true, silent=true, buffer=bufnr }
telescope.load_extension("bibtex")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fd', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fr', ":Telescope bibtex<cr>", {silent=true})

local st=require('st.telescope')
vim.keymap.set('n', '<leader>fkb', st.edit_kb, {})
vim.keymap.set('n', '<leader>fd', st.edit_dotfiles, {})
vim.keymap.set('n', '<leader>fs', st.edit_snippets, {})
vim.keymap.set('n', '<leader>fc', st.edit_all_codes, {})

