# personal
export MY_PATHS="~/JS/bin/private_hashtable.ps1;~/JS/bin/repo.ps1"

export JS="~/JS"

export MY_CD_CLI_PATH="~/asd/bin/asd.ps1"

# gpg
export GPG_TTY=$(tty)

# dotnet
export DOTNET_ROOT="$HOME/.dotnet"

# path
export PATH="$PATH:$DOTNET_ROOT:/Applications/Docker.app/Contents/Resources/bin:$HOME/JS/bin:$HOME/asd/bin:$HOME/.dotnet/tools:$HOME/.local/share/bob/nvim-bin"


# darwin
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export EDITOR="nvim"
export TERMINAL="wezterm"

