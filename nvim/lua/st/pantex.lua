local pandocgroup = vim.api.nvim_create_augroup('pandocgroupe', { clear = false })


local comp_exit = function(obj)
    print("Compilation Done with code: "..obj.code)
end

function compile_start()
    filename = vim.fn.expand("%:f")
    vim.cmd(":!pantex "..filename)
    --vim.system({"pantex ",filename},{},comp_exit)
    vim.api.nvim_create_autocmd({ 'BufWritePost'}, {
        pattern = '*.md',
        group = pandocgroup,
        callback = function()
            --vim.cmd(":silent !pantex "..filename)
            --vim.system({"/home/pranphy/.local/bin/pantex",filename},{text=true},comp_exit)
            vim.system({"/home/pranphy/repos/dotfiles/script/pantex",filename})
            --vim.system("pantex "..filename.." &")
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
