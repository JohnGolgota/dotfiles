
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



if command -v zoxide &> /dev/null 2>&1; then
    eval "$(zoxide init zsh)"
    alias cd=z
fi

if command -v fzf &> /dev/null 2>&1; then
    # Set up fzf key bindings and fuzzy completion
    source <(fzf --zsh)
fi

if command -v atuin &> /dev/null 2>&1; then
    eval "$(atuin init zsh)"
fi

if command -v starship &> /dev/null 2>&1; then
    eval "$(starship init zsh)"
fi
# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
