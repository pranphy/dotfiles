-- vim: ft=lua
local M = {}

function M.edit_dotfiles()
    require('telescope.builtin').find_files( {
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
    require('telescope.builtin').find_files( {
        shorten_path = true,
        cwd = '~/repos/dimag/',
        prompt_title  = "Dimag",
    })
end

function M.edit_snippets()
    require('telescope.builtin').find_files( {
        shorten_path = true,
        cwd = '~/.config/nvim/luasnip/',
        prompt_title  = "Snippets",
    })
end


return M

