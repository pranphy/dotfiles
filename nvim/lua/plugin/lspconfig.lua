local lspconfig = require'lspconfig'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<space>K', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end


lspconfig.pyright.setup({
  on_attach = on_attach,
  settings = {
    python = {
      analysis = {
        reportUnusedVariable = true ,
        typeCheckingMode = "basic"
      }
    }
  }

})

--lspconfig.ccls.setup{
--  on_attach = on_attach,
--  cmd = { "ccls" },
--  single_file_support = true,
--  --filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
--}

lspconfig.clangd.setup{
  on_attach = on_attach,
  cmd = { "clangd" },
  single_file_support = true,
  --filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
}

--lspconfig.texlab.setup{}
lspconfig.julials.setup{}

lspconfig.marksman.setup{}
--lspconfig.kotlin_language_server.setup{}

vim.lsp.set_log_level("INFO")

-- Related to LSP but general(?) functions
vim.diagnostic.config({
  virtual_text = false, -- looks very ugly with multiple errors and red text
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

--lspconfig.ltex_plus.setup{
--    on_attach = on_attach,
--    enabled = true,
--    cmd = {'ltex-ls-plus'},
--    settings = { ltex = { enabled=true, language= 'en-GB' },},
--    filetypes = {"tex", "latex"},
--}



local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

