local telescope = require('telescope')
telescope.setup({
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--no-ignore-vcs',
      '--ignore-file', vim.env.HOME..'/.rgignore',
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
      find_command = { "rg","--files","--no-ignore-vcs","--ignore-file",vim.env.HOME.."/.rgignore","--ignore-file","./.rgignore"},
    }
  },
  extensions = {
    bibtex = {
      depth = 1,
      custom_formats = {},
      format = '',
      global_files = {vim.env.HOME.."/repos/texmf/bibtex/bib"},
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

telescope.load_extension("file_browser")

local builtin = require("telescope.builtin")

function edit_geant()
    builtin.find_files( {
        shorten_path = true,
        cwd = '~/sft/geant4/geant4.10.07.p04/',
        prompt_title  = "Dimag",
    })
end

function edit_comptong4()
    builtin.find_files( {
        shorten_path = true,
        cwd = '~/sft/compton/HallA_ComptonG4/',
        prompt_title  = "Dimag",
    })
end

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fd', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fr', ":Telescope bibtex<cr>", {silent=true})
vim.keymap.set('n', '<leader>fi', ":Telescope media_files<cr>", {silent=true})
vim.keymap.set('n', '<leader>fe', ":Telescope file_browser<cr>", {silent=true})

local st=require('st.telescope')
vim.keymap.set('n', '<leader>fkb', st.edit_kb, {})
vim.keymap.set('n', '<leader>fd', st.edit_dotfiles, {})
vim.keymap.set('n', '<leader>fG', edit_geant, {})
vim.keymap.set('n', '<leader>fC', edit_comptong4, {})
vim.keymap.set('n', '<leader>fs', st.edit_snippets, {})
vim.keymap.set('n', '<leader>fc', st.edit_all_codes, {})

