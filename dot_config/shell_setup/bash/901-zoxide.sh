if command -v zoxide &> /dev/null 2>&1; then
    eval "$(zoxide init bash)"
    alias cd=z
fi

