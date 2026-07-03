local pmd = require("pamdex")


pmd.setup({
    output_path = "/tmp",
    --template = nil,
    template = "sak",
    verbose = false,
    codebox = true,
    minted = true,
    meta_yaml = "meta.yaml",
    minted_style = "emacs",
    citeproc = true,
    --variables = {[[tables=tabular]]},
    --header_includes = {[[\usepackage{fontspec}]],[[\setmainfont{EB Garamond}]]},
    extra_args = {"--toc"},
    transforms = {
        {"\\ket{(.-)}",[[\left\langle%1\right\rvert ]]},
        {"\\bra{(.-)}",[[\left\lvert%1\right\rangle ]]},
        {"\\to",[[\rightarrow ]]},
        {"\\ll",[[<< ]]},
        {"\\mathcal{(.-)}",[[%1 ]]},
        {"\\ip{(.-)}{(.-)}",[[\left\langle%1,%2\right\rangle ]]}
    }
})


vim.keymap.set("n","<Leader>pm",pmd.compile_start)
vim.keymap.set("n","<Leader>pv",pmd.open_it)
