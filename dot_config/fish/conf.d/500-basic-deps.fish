if command -v fnm &>/dev/null
    fnm env --use-on-cd --shell fish | source
end

if command -v zoxide &>/dev/null
    zoxide init fish | source
end

if command -v starship &>/dev/null
    starship init fish | source
end
