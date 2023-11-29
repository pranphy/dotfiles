require("core")
require("plugin")

vim.opt.rtp:prepend("~/.Rough/nvim/tepl")

require("tepl").setup({
    shell = {
        default = "python",
        lua = "lua"
    }
})
