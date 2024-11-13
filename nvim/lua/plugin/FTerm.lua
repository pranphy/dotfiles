ft = require("FTerm")
ft.setup({
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})

-- Example keybindings
vim.keymap.set('n', '<A-i>', ft.toggle)
vim.keymap.set('t', '<A-i>', ft.toggle)
