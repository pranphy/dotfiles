-- vim: ft=lua
local textobjects_config = {
  select = {
    enable = true,
    lookahead = true,
    keymaps = {
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
    },
    selection_modes = {
      ['@parameter.outer'] = 'v', -- charwise
      ['@function.outer'] = 'V', -- linewise
      ['@class.outer'] = '<c-v>', -- blockwise
    },
    include_surrounding_whitespace = true,
  },
}

require('nvim-treesitter.configs').setup({
 -- ensure_installed = {"lua","python","c","cpp","julia","latex","bash","markdown","markdown_inline"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
 ensure_installed = {"lua","python","c","cpp","julia","bash","latex","hyprlang","markdown","markdown_inline","html", "yaml","typst"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "latex","markdown"},  -- list of language that will be disabled
  },
  textobjects =  textobjects_config;
})

