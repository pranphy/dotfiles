-- vim: ft=lua
local M = {}

local builtin = require("telescope.builtin")

function M.edit_dotfiles()
    builtin.find_files( {
        shorten_path = true,
        cwd = '~/repos/dotfiles/',
        prompt_title  = "dotiles",
        height = 10,
        layout_options = {
            preview_width = 0.75,
        },
    })
end

function M.edit_kb()
    builtin.find_files( {
        shorten_path = true,
        cwd = '~/repos/dimag/',
        prompt_title  = "Dimag",
    })
end

function M.edit_snippets()
    builtin.find_files( {
        shorten_path = true,
        cwd = '~/.config/nvim/luasnip/',
        prompt_title  = "Snippets",
    })
end


function M.edit_all_codes()
    vim.ui.input({prompt = 'Enter path: '}, function(input)
      builtin.find_files( {
          shorten_path = true,
          cwd = input,
          prompt_title  = "From :" .. input,
      })
   end)
end

return M

