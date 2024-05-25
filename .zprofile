
eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(zoxide init zsh)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

export GPG_TTY=$(tty)

export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin"

export PATH="$PATH:/Users/usuario/JS/bin"

export PATH="$PATH:/Users/usuario/asd/bin"

export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

if [[ -f ~/.zshprofile ]]; then
	source ~/.zshprofile
fi

if [[ -f ~/.zsh_aliases ]]; then
	source ~/.zsh_aliases
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
