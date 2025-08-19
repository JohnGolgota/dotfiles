# Environment variables
load-env {
    MY_GITUI: "gitui"
    MY_EXPLORER: "yazi"
    MY_EDITOR: "nvim"
}

$env.config.show_banner = false
$env.config.buffer_editor = $env.MY_EDITOR
$env.config.edit_mode = "vi"

# path
$env.PATH ++= [
    "/home/linuxbrew/.linuxbrew/sbin",
    "/home/linuxbrew/.linuxbrew/bin",
    "/home/bazzite/.config/a-cli/bin",
    "/home/bazzite/bin",
    "/home/bazzite/.deno/bin",
    "/var/opt/microsoft/powershell/7",
]


