# Environment variables
load-env {
    MY_GITUI: "gitui"
    MY_EXPLORER: "yazi"
    MY_EDITOR: "nvim"
}

$env.config.show_banner = false
$env.config.buffer_editor = $env.MY_EDITOR

# Plugins
const zoxide_path = "~/.config/zoxide/.zoxide.nu"
const zoxide_module = (if ($zoxide_path | path exists) {$zoxide_path})
source $zoxide_module


source shellSetup/keybindings.nu
source shellSetup/aliases.nu
source functions/index.nu
