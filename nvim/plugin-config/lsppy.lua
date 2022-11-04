require('lspconfig').pyright.setup({
    settings = {
        python = {
            analysis = { 
                reportUnusedVariable = true ,
                typeCheckingMode = "basic"
            }
        }
    }

})
vim.lsp.set_log_level("debug")
