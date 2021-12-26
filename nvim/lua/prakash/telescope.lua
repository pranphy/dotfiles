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
vim.cmd('nnoremap <leader>fg <cmd>Telescope live_grep<cr>')
vim.cmd('nnoremap <leader>fb <cmd>Telescope buffers<cr>')
vim.cmd('nnoremap <leader>fh <cmd>Telescope help_tags<cr>')

local M = {}

function M.edit_dotfiles()
    require('telescope.builtin').git_files( {
        shorten_path = true,
        cwd = '~/GitRepos/MyDotFiles/',
        prompt_title  = "Git Repos",
        height = 10,
        --layout_strategy = 'vertical',
        --layout_options = {
        --    preview_width = 0.75,
        --},
    })
end


--function M.edit_kb()

return M
