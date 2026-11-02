#!/usr/bin/env bash

# Modified script from https://github.com/bahamas10/bash-cdstack/

CD_STACK_MAX=${CD_STACK_MAX:-15}

_CD_STACK=("$PWD")
_CD_STACK_PTR=0

ls-post-cd() {
    local max_items=24

    local ls_item_count
    ls_item_count=$(ls -A | wc -l)

    if [[ $ls_item_count -lt $max_items ]]; then
        ls --color -pA
    else
        local ls_new_item_count=$(ls | wc -l)
        if [[ $ls_new_item_count -lt $max_items ]]; then
            ls --color -p
            echo "(from cd-ls) showing only $ls_new_item_count non-hidden out of $ls_item_count total."
        else
            echo "(from cd-ls) too many items in directory: $ls_item_count."
        fi
    fi
}

cd() {
    #builtin cd "$@" || return
    z "$@" # zoxide version

    local ret=$?
    ((ret == 0)) || return "$ret"

    ls-post-cd

    _CD_STACK=("$PWD" "${_CD_STACK[@]}")
    if ((${#_CD_STACK[@]} > CD_STACK_MAX)); then
        unset "_CD_STACK[${#_CD_STACK[@]}-1]"
    fi
    _CD_STACK_PTR=0

    return "$ret"
}

s() {
    if [[ -n $1 ]]; then
        local dir=${_CD_STACK[$1]}
        builtin cd "$dir" || return
        local ret=$?
        if ((ret == 0)) && [[ -n $dir ]]; then
            _CD_STACK_PTR=$1
        fi
        ls-post-cd
        return "$ret"
    fi

    local max=${#_CD_STACK[@]}
    local i
    local arrow
    arrow="$(tput setaf 2)->$(tput sgr0)"
    for ((i = 0; i < max; i++)); do
        local j=$i
        [[ -n $CD_STACK_REVERSE ]] && j=$((max - 1 -i))
        if ((j == _CD_STACK_PTR)); then
            echo -n "$arrow"
        else
            echo -n '  '
        fi
        printf '%2d: %s\n' "$j" "${_CD_STACK[$j]/#$HOME/\~}"
    done
}

b() {
    s "$((_CD_STACK_PTR + 1))"
}

f() {
    s "$((_CD_STACK_PTR - 1))"
}
