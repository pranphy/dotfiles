-- vim: ft=lua


local ensure_installed = {"lua","python","vimdoc","c","cpp","julia","bash","latex","hyprlang","markdown","markdown_inline","html", "yaml","typst","vim"} -- one of "all", "maintained" (parsers with maintainers), or a list of languages

local already_installed = require('nvim-treesitter.config').get_installed()

local parsers_to_install = vim.iter(ensure_installed) :filter(
    function(parser)
      return not vim.tbl_contains(already_installed, parser)
    end
):totable()
require('nvim-treesitter').install(parsers_to_install)

vim.api.nvim_create_autocmd('FileType', { 
    callback = function() 
        -- Enable treesitter highlighting and disable regex syntax
        pcall(vim.treesitter.start) 
        -- Enable treesitter-based indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" 
    end, 
})

 

require("nvim-treesitter-textobjects").setup({
    select = {
        lookahead = true,
        selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V', -- linewise
            --['@class.outer'] = '<c-v>', -- blockwise
        },
        include_surrounding_whitespace = true,
    },
})

local tstompas = {
    ["af"] = "@function.outer",
    ["if"] = "@function.inner",
    ["ac"] = "@class.outer",
    ["ic"] = "@class.inner", 
}

local tof = function(val)
    return function()
        require("nvim-treesitter-textobjects.select").select_textobject(val,"textobjects")
    end
end

for key, query in pairs(tstompas) do
    vim.keymap.set({ "x", "o" }, key, tof(query), { noremap = true, silent = true })
end
