
color gruvbox 
"color badwolf 
highlight Normal guibg=NONE ctermbg=NONE
"

"inoremap <buffer> aln \begin{align*}<esc>o\end{align*}<esc>O
nnoremap  tme :split ~/.config/nvim/ftplugin/tex_mappings.vim<cr>
nnoremap  tml :source ~/.config/nvim/ftplugin/tex_mappings.vim<cr>

nnoremap <Leader>tc :!texcount %<cr>

inoremap <A-j> <esc>F=i&<esc>A \\<esc>o


function! EncloseMath()
    let str = getreg("@")
    return "$" . str . "$"
endfunction

vnoremap mm s<C-R>=EncloseMath()<CR><ESC>

