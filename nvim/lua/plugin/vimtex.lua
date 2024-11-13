vim.cmd[[
"
" Vimtex configuration
let g:vimtex_view_method = 'zathura'
"let g:vimtex_syntax_enabled = 0
let g:vimtex_syntax_conceal = {
    \'accents': 1,
      \ 'ligatures': 1,
      \ 'cites': 1,
      \ 'fancy': 1,
      \ 'spacing': 1,
      \ 'greek': 1,
      \ 'math_bounds': 1,
      \ 'math_delimiters': 1,
      \ 'math_fracs': 1,
      \ 'math_super_sub': 1,
      \ 'math_symbols': 1,
      \ 'sections': 0,
      \ 'styles': 1,
      \}

let g:vimtex_matchparen_enabled=0
"let g:matchup_override_vimtex=1
"let g:matchup_matchparen_deferred=1
let vimtex_fild_enabled=1
let g:vimtex_compiler_method = 'latexmk'
]]
