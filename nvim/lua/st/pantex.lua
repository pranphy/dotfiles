local pandocgroup = vim.api.nvim_create_augroup('pandocgroupe', { clear = false })

function compile_start()
    filename = vim.fn.expand("%:f")
    vim.cmd(":!pantex "..filename)
    vim.api.nvim_create_autocmd({ 'FileWritePost', 'BufWritePost' }, {
        pattern = '*.md',
        group = pandocgroup,
        callback = function()
            vim.cmd(":silent !pantex "..filename)
            --vim.cmd(":!pantex "..filename.." &")
        end
    })
end

function open_it()
    pdf = vim.fn.expand("%:r")..".pdf"
    vim.cmd(":silent !zathura "..pdf.." &")
end



vim.keymap.set("n","<Leader>nn",compile_start)
vim.keymap.set("n","<Leader>nv",open_it)
