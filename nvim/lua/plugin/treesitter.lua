-- vim: ft=lua
require('nvim-treesitter.configs').setup({
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  --additional_vim_regex_highlighting = true,
  highlight = {
    enable = true,              -- false will disable the whole extension
    --disable = { "latex","tex"},  -- list of language that will be disabled
  },
})
