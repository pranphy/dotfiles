#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4 ft=sh

# author : Prakash [प्रकाश]
# date   : 2020-11-25 00:40

if [[ ${HOSTNAME} == "Prakash" ]]
then
    export RCLONE_HOME="/opt/rclone"
    export PATH="$RCLONE_HOME:${PATH}"

    #Zotero home
    export ZOTERO_HOME="/opt/Zotero"
    export PATH="$ZOTERO_HOME:${PATH}"


    export PATH="${HOME}/.local/bin:$PATH"

    if [ -f "${HOME}/.Rough/GitPrompt/gitprompt.sh" ]; then
        GIT_PROMPT_ONLY_IN_REPO=1
        source ${HOME}/.Rough/GitPrompt/gitprompt.sh
    fi
    export MYROOT="${HOME}/MyRoot"
fi
