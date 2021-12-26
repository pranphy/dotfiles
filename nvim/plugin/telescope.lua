-- vim: ft=lua
require('telescope').setup({
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
    layout_config = {
        vertical = { width = 0.5 }
    },
  }
});

vim.cmd('nnoremap <leader>ff <cmd>Telescope find_files<cr>')
vim.cmd('nnoremap <leader>fz <cmd>Telescope file_browser<cr>')
vim.cmd('nnoremap <leader>fg <cmd>Telescope live_grep<cr>')
vim.cmd('nnoremap <leader>fb <cmd>Telescope buffers<cr>')
vim.cmd('nnoremap <leader>fh <cmd>Telescope help_tags<cr>')

require('prakash.telescope')

