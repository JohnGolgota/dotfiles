if test -f (command -v fnm)
    fnm env --use-on-cd --shell fish | source
end

if test -f (command -v zoxide)
    zoxide init fish | source
end

if test -f (command -v starship)
    starship init fish | source
end
