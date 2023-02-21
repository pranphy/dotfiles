#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4 ft=sh

# author : Prakash [प्रकाश]
# date   : 2020-11-25 00:40

if [[ ${HOSTNAME} == "gluon" ]]
then
    export CDPATH=.:~:~/repos:~/Sabthok/Education/Graduate/Drexel:~/Sabthok/Programming/Projects:~/.Rough
    DOTFILES=${HOME}/repos/dotfiles

    export PATH="${DOTFILES}/script:${HOME}/.local/bin:$PATH"
    source ${DOTFILES}/bash/bash_utils
    source ${DOTFILES}/bash/bash_utils_ne


    if type rg &> /dev/null; then
        export FZF_DEFAULT_COMMAND='rg --ignore-file ~/.rgignore --files --hidden'
    fi
    export FZF_DEFAULT_OPTS="--height 60% --layout=reverse --border --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
    export FZF_COMPLETION_OPTS='--border --info=inline'
    FZF_COMPLETION_FILE=/usr/share/bash-completion/completions/fzf
    [[ -f ${FZF_COMPLETION_FILE} ]] && source ${FZF_COMPLETION_FILE}
    FZF_KEY_BINDING_FILE="/etc/profile.d/fzf.bash"
    [[ -f ${FZF_KEY_BINDING_FILE} ]] && source ${FZF_KEY_BINDING_FILE}

    LF_ICONS=$(sed ~/.config/lf/diricons \
            -e '/^[ \t]*#/d'       \
            -e '/^[ \t]*$/d'       \
            -e 's/[ \t]\+/=/g'     \
        )
        #-e 's/$/ /')
    LF_ICONS=${LF_ICONS//$'\n'/:}
    export LF_ICONS

    export MYROOT="${HOME}/st"
    [[ -f ${MYROOT}/enable.sh ]] && source ${MYROOT}/enable.sh
fi
