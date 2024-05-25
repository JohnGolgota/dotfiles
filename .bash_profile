#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
. "$HOME/.cargo/env"
# Add .NET Core SDK tools
export PATH="$PATH:/home/js/.dotnet/tools"
