"let g:loaded_youcompleteme = 0
let g:ycm_global_ycm_extra_conf='~/.config/nvim/ycm/ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ["jj","<down>"]
let g:ycm_confirm_extra_conf=0
let g:cpp_class_scope_highlight=1

" YCM Support for latex family language
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme
let g:ycm_register_as_syntastic_checker=1
