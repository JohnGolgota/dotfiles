# Created by newuser for 5.9
#
# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"

# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi

# Source manjaro-zsh-configuration
if [[ -e ~/.zsh_aliases]]; then
  source ~/.zsh_aliases
fi

# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# DOTNET - Required
export PATH="$PATH:$HOME/.dotnet/tools"
# DOTNET - Optional
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export ASPNETCORE_ENVIRONMENT=Development


eval "$(starship init zsh)"

export GPG_TTY=$(tty)

export PATH="/run/user/1000/fnm_multishells/11126_1717251197038/bin":$PATH
export FNM_DIR="/home/jiss/.local/share/fnm"
export FNM_RESOLVE_ENGINES="false"
export FNM_NODE_DIST_MIRROR="https://nodejs.org/dist"
export FNM_LOGLEVEL="info"
export FNM_MULTISHELL_PATH="/run/user/1000/fnm_multishells/11126_1717251197038"
export FNM_COREPACK_ENABLED="true"
export FNM_ARCH="x64"
export FNM_VERSION_FILE_STRATEGY="local"
