# Environment variables
load-env {
    MY_GITUI: "gitui"
    MY_EXPLORER: "yazi"
    MY_EDITOR: "nvim"
}

$env.config.show_banner = false
$env.config.buffer_editor = $env.MY_EDITOR
$env.config.edit_mode = "vi"

# Plugins
const zoxide_path = "~/.config/zoxide/.zoxide.nu"
const zoxide_module = (if ($zoxide_path | path exists) {$zoxide_path})
source $zoxide_module

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# setup
source shellSetup/keybindings.nu
source shellSetup/aliases.nu
source functions/index.nu
