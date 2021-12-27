#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4 ft=sh

# author : Prakash [प्रकाश]
# date   : 2020-11-25 00:40

if [[ ${HOSTNAME} == cent* || ${HOSTNAME} == ocio* ]]
then
    OTHER="$(readlink -f ~/Other)"

    export CDPATH=.:${OTHER}:${OTHER}/GitRepos

    if type rg &> /dev/null; then
        export FZF_DEFAULT_COMMAND='rg --ignore-file ~/.rgignore --files --hidden'
    fi
    export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --border'

    export MYROOT="${OTHER}/st"
    if [[ ${MYROOT} != "" ]]
    then
        source ${MYROOT}/enable.sh
    fi
fi

