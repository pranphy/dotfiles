if exists('g:vscode')
    runtime vscode.vim
else
    runtime vimrc.vim
    if has ('nvim')
        runtime nvimrc.vim
    endif
endif
