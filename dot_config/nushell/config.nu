# Environment variables
$env.config.show_banner = false
$env.config.buffer_editor = "nvim"

# Aliases
alias x = nvim
alias g = git
alias gg = gitui

def pw [args: string] {
    pwsh -c $"($args)"
}

def path_exists [dir: string] {
    if ($dir | path exists) {
        return $dir
    }
    return null
}

const zoxide_path = "~/.config/zoxide/.zoxide.nu"
const zoxide_module = (if ($zoxide_path | path exists) {$zoxide_path})
source $zoxide_module

