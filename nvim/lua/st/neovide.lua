function scale(factor)
    return function()
        vim.g.neovide_scale_factor = factor*vim.g.neovide_scale_factor
    end
end


if vim.g.neovide then
    --vim.o.guifont = "Iosevka Term:h17"
    vim.o.guifont = "IosevkaTermSlab Nerd Font:h17"
    vim.g.neovide_input_ime = true
    vim.g.neovide_cursor_vfx_mode = "pixiedust"
    vim.keymap.set({ "n", "v" }, "<C-+>", scale(1.1))
    vim.keymap.set({ "n", "v" }, "<C-_>", scale(0.9))
end

