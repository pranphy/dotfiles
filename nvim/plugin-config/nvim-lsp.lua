local lspconfig = require'lspconfig'

lspconfig.pyright.setup({
    settings = {
        python = {
            analysis = { 
                reportUnusedVariable = true ,
                typeCheckingMode = "basic"
            }
        }
    }

})

lspconfig.clangd.setup{
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
}


vim.lsp.set_log_level("INFO")
