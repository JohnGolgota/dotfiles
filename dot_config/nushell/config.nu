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

# setup
source shellSetup/keybindings.nu
source shellSetup/aliases.nu
source functions/index.nu
source modules/customVars/mod.nu

# Plugins
# fnm
load-env (fnm env --shell bash
	| lines
	| str replace 'export ' ''
	| str replace -a '"' ''
	| split column "="
	| rename name value
	| where name != "FNM_ARCH" and name != "PATH"
	| reduce -f {} {|it, acc| $acc | upsert $it.name $it.value }
)

$env.PATH = ($env.PATH
	| split row (char esep)
	| prepend $"($env.FNM_MULTISHELL_PATH)/bin"
)


# zoxide
const zoxide_path = "~/.config/zoxide/.zoxide.nu"
const zoxide_module = (if ($zoxide_path | path exists) {$zoxide_path})
source $zoxide_module

# starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

