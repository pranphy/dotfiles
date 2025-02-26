ft = require("FTerm")
ft.setup({
    border = 'rounded',
    dimensions  = {
        height = 0.95,
        width = 0.95,
    },
})

-- Example keybindings
if vim.g.neovide then
    vim.keymap.set('n', '<A-i>', ft.toggle)
    vim.keymap.set('t', '<A-i>', ft.toggle)

    vim.keymap.set({"n","i","t"}, '<C-z>', ft.toggle)
end
