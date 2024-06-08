if [[ -f ~/shell-setup/envs.sh ]]; then
	source ~/shell-setup/envs.sh
fi

if [[ -f ~/shell-setup/aliases.sh ]]; then
	source ~/shell-setup/aliases.sh
fi

eval "$(zoxide init zsh)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
