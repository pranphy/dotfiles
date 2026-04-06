local pmd = require("pamdex")


pmd.setup({
    output_path = "/tmp",
    --template = nil,
    template = "sak",
    verbose = true,
    codebox = true,
    minted = true,
    meta_yaml = "meta.yaml",
    minted_style = "emacs",
    citeproc = true,
    --variables = {[[tables=tabular]]},
    --header_includes = {[[\usepackage{fontspec}]],[[\setmainfont{EB Garamond}]]},
    extra_args = {"--toc"},
})


vim.keymap.set("n","<Leader>pm",pmd.compile_start)
vim.keymap.set("n","<Leader>pv",pmd.open_it)
