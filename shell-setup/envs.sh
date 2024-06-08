
export MY_PATHS="~/JS/bin/private_hashtable.ps1;~/JS/bin/repo.ps1"

export JS="/Users/usuario/JS"

export MY_CD_CLI_PATH="~/asd/bin/asd.ps1"

export GPG_TTY=$(tty)

export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin"

export PATH="$PATH:/Users/usuario/JS/bin"

export PATH="$PATH:/Users/usuario/asd/bin"

export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

export PATH="$PATH:$HOME/.dotnet/tools"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
~/.bun/bin

# pnpm
export PNPM_HOME="/home/jiss/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end