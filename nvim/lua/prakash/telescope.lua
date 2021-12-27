-- vim: ft=lua
local M = {}

function M.edit_dotfiles()
    require('telescope.builtin').git_files( {
        shorten_path = true,
        cwd = '~/GitRepos/MyDotFiles/',
        prompt_title  = "Dotfiles",
        height = 10,
        layout_options = {
            preview_width = 0.75,
        },
    })
end


function M.edit_kb()
    require('telescope.builtin').git_files( {
        shorten_path = true,
        cwd = '~/GitRepos/Dimag/',
        prompt_title  = "Knowledge Base",
    })
end

return M
