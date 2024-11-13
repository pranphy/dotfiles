require("core")
require("plugin")

vim.opt.rtp:prepend("~/.Rough/nvim/cmp-im")

if vim.g.neovide then
    --vim.o.guifont = "Iosevka Term:h17"
    vim.o.guifont = "Delugia Light:h17"
    vim.g.neovide_input_ime = true
    vim.g.neovide_cursor_vfx_mode = "pixiedust"
end
