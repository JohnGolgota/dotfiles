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

