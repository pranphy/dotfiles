local nevl = require("nevl")
nevl.setup({
    shell = {
        default = "python3",
        lua = "lua"
    }
})

vim.keymap.set("v", "<leader><cr>", function()
    vim.fn.feedkeys([["+y]])
    nevl.run_in_repl({"checkpoint_paste()"})
end,{remap=true})
