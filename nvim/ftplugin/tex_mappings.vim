
"color gruvbox 
"color badwolf 

"inoremap <buffer> aln \begin{align*}<esc>o\end{align*}<esc>O
nnoremap  tme :vsplit ~/.config/nvim/ftplugin/tex_mappings.vim<cr>
nnoremap  tml :source ~/.config/nvim/ftplugin/tex_mappings.vim<cr>

nnoremap <Leader>tc :!texcount %<cr>

inoremap <A-j> <esc>F=i&<esc>A \\<esc>o


function! EncloseMath()
    let str = getreg("@")
    return "$" . str . "$"
endfunction

vnoremap mm s<C-R>=EncloseMath()<CR><ESC>

function RemoveCurdirVimtexExpr()
    "let v:fname = substitute(v:fname,'\curdir','\\.','g')
    return  substitute(v:fname,'\\curdir','\\.','g')
endfunction

inoremap <C-/> <esc>maI%<esc>`a

set includeexpr=vimtex#include#expr()


abbrev phia \phi_a
abbrev phimu \phi_\mu
abbrev phinu \phi_\nu
abbrev Lgr \mathcal{L}
abbrev d4x d^4x
abbrev dmu \partial_\mu
abbrev dnu \partial_\nu


