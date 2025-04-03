function scale(factor)
    return function()
        vim.g.neovide_scale_factor = factor*vim.g.neovide_scale_factor
    end
end

function alpha()
  return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end


if vim.g.neovide then
    --vim.o.guifont = "Iosevka Term:h17"
    vim.o.guifont = "IosevkaTermSlab Nerd Font:h23"
    vim.g.neovide_input_ime = true
    vim.g.neovide_cursor_vfx_mode = "torpedo"
    vim.keymap.set({ "n", "v" }, "<C-+>", scale(1.1))
    vim.keymap.set({ "n", "v" }, "<C-_>", scale(0.9))
    vim.keymap.set("i","<C-S-v>","<esc><leader>pI", {remap=true})

    -- g:neovide_opacity should be 0 if you want to unify transparency of content and title bar.
    --vim.g.neovide_opacity = 0.7
    --vim.g.neovide_normal_opacity = 0.7
    --vim.g.transparency = 0.7
    --vim.g.neovide_background_color = "#0f1117" .. alpha()
    vim.g.neovide_cursor_animate_in_insert_mode = true
end

