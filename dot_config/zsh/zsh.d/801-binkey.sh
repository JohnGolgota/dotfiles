open_editor() {
    if [[ -n $EDITOR ]]; then
        $EDITOR "$@"
    else
        echo "No editor set"
    fi
}

zle -N open_editor
bindkey '^E' open_editor

open_yazi() {
    yazi
}

zle -N open_yazi
bindkey '^Q' open_yazi

open_gitui() {
    gitui
}

zle -N open_gitui
bindkey '^G' open_gitui

zle -N zi
bindkey '^F' zi

