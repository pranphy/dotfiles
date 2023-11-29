local telescope = require('telescope')
telescope.setup({
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--no-ignore-vcs',
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
      hidden = true,
      find_command = { "rg","--files","--no-ignore-vcs"},
    }
  },
  extensions = {
    bibtex = {
      depth = 1,
      custom_formats = {},
      format = '',
      global_files = {"/home/pranphy/repos/texmf/bibtex/bib"},
      search_keys = { 'author', 'year', 'title' },
      citation_format = '{{author}} ({{year}}), {{title}}.',
      citation_trim_firstname = true,
      citation_max_auth = 2,
      context = false,
      context_fallback = true,
      wrap = false,
    },
    media_files = {
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg"
    },
  }
});


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fd', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fr', ":Telescope bibtex<cr>", {silent=true})
vim.keymap.set('n', '<leader>fi', ":Telescope media_files<cr>", {silent=true})

local st=require('st.telescope')
vim.keymap.set('n', '<leader>fkb', st.edit_kb, {})
vim.keymap.set('n', '<leader>fd', st.edit_dotfiles, {})
vim.keymap.set('n', '<leader>fs', st.edit_snippets, {})
vim.keymap.set('n', '<leader>fc', st.edit_all_codes, {})

