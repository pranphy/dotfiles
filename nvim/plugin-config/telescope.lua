-- vim: ft=lua
local telescope = require('telescope')
telescope.setup({
  defaults = {
    vimgrep_arguments = {
      'rg',
      --'--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
  }
});

-- local bufopts = { noremap=true, silent=true, buffer=bufnr }

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fd', builtin.help_tags, {})

local st=require('st.telescope')
vim.keymap.set('n', '<leader>fkb', st.edit_kb, {})
vim.keymap.set('n', '<leader>fd', st.edit_dotfiles, {})

