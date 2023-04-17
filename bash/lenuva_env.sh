#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4 ft=sh

# author : Prakash [प्रकाश]
# date   : 2020-11-25 00:40

if [[ ${HOSTNAME} == "lenuva" ]]
then
    export CDPATH=.:~:~/repos:~/.Rough


    if [ -f "${HOME}/.Rough/GitPrompt/gitprompt.sh" ]; then
        GIT_PROMPT_ONLY_IN_REPO=1
        source ${HOME}/.Rough/GitPrompt/gitprompt.sh
    fi

    if type rg &> /dev/null; then
        export FZF_DEFAULT_COMMAND='rg --no-ignore --ignore-file ~/.rgignore --files --hidden'
    fi
    export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --border --preview="bat -p --color=always {}"'
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
    [[ -f ~/sft/enable.sh ]] && source ~/sft/enable.sh
    export PATH="${HOME}/.local/bin:$PATH:${HOME}/repos/dotfiles/script"
fi
