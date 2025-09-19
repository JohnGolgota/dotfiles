function Get-LinuxPaths
{
    return @(
        "$(join-path ${HOME} ".local" "share" "bob" "nvim-bin")",
        "$(join-path ${HOME} ".local" "share" "pnpm")",
        "$(join-path ${HOME} "bin")",
        "$(join-path ${HOME} ".deno" "bin")",
        "$(join-path ${HOME} ".cargo" "bin")",
        "$(join-path ${HOME} ".bun" "bin")",

        "/$(join-path "home" "linuxbrew" ".linuxbrew" "sbin")",
        "/$(join-path "home" "linuxbrew" ".linuxbrew" "bin")"
    )
}

function Get-MacOSPaths
{
    return @(
        "$(join-path ${HOME} ".local" "share" "pnpm")",
        "$(join-path ${HOME} ".bun" "bin")",
        "$(join-path ${HOME} ".nix-profile" "bin")",

        "/$(join-path "opt" "homebrew" "opt" "openjdk" "bin")",
        "/$(join-path "opt" "homebrew" "bin")",
        "/$(join-path "opt" "homebrew" "sbin")",
        "/$(join-path "Applications" "Docker.app" "Contents" "Resources" "bin")",
        "/$(join-path "nix" "var" "nix" "profiles" "default" "bin")"
    )
}

function Set-FullPath
{
    $Paths = @(
        "$(join-path ${HOME} ".config" "a-cli" "bin")"
    )

    if ($IsMacOS)
    {
        $Paths += Get-MacOSPaths
        $Paths += Get-LinuxPaths
    }

    if ($IsLinux)
    {
        $Paths += Get-LinuxPaths
    }

    $separator = if ($IsWindows)
    {
        ";"
    } else
    {
        ":"
    }
    $NewPath = $Paths -join $separator
    Add-Content -Path $PROFILE -Value "`n"
    Add-Content -Path $PROFILE -Value "`$Env:PATH = `"${NewPath}${separator}`$Env:PATH`""
}

function Set-CustomModulesImports
{
    Add-Content -Path $PROFILE -Value "`n"
    Add-Content -Path $PROFILE -Value ". $(Join-Path ${HOME} ".config" "powershell" "custom_moduls" "Custom_Functions.ps1")"
    Add-Content -Path $PROFILE -Value ". $(Join-Path ${HOME} ".config" "powershell" "custom_moduls" "PS_Alias.ps1")"
    Add-Content -Path $PROFILE -Value ". $(Join-Path ${HOME} ".config" "powershell" "custom_moduls" "CustomVarsModule.ps1")"
    Add-Content -Path $PROFILE -Value ". $(Join-Path ${HOME} ".config" "powershell" "custom_moduls" "Custom_PSReadLineKeyHandler.ps1")"
    Add-Content -Path $PROFILE -Value ". $(Join-Path ${HOME} ".config" "powershell" "custom_moduls" "Envs.ps1")"
}

function Set-Envs
{
    if ($IsWindows)
    {

        Add-Content -Path $PROFILE -Value "`n"
        Add-Content -Path $PROFILE -Value "`$Env:KOMOREBI_CONFIG_HOME = `"$(Join-Path ${HOME} ".config" "komorebi")`""
    }
    if ($IsMacOS)
    {

        Add-Content -Path $PROFILE -Value "`n"
        Add-Content -Path $PROFILE -Value "`$Env:GPG_TTY = `$(tty)"
    }
}

function Start-MainProccess
{

    Write-Host "Configuring profile..."
    if (-not (Test-Path $PROFILE))
    {
        Write-Host "Creating profile..."
        New-Item -Path $PROFILE -ItemType File
    }

    Write-Host "Cleaning profile..."
    Set-Content -Path $PROFILE -Value ""

    # Config PS region
    Add-Content -Path $PROFILE -Value "Set-PSReadLineOption -EditMode Vi"

    # Imports
    Set-CustomModulesImports

    # generic path
    Set-FullPath

    # Envs
    Set-Envs

    # others programs configs
    if (Get-Command "fnm" -ErrorAction SilentlyContinue)
    {
        Add-Content -Path $PROFILE -Value "`n"
        Add-Content -Path $PROFILE -Value "fnm env --use-on-cd | Out-String | Invoke-Expression"
    }

    if (Get-Command "starship" -ErrorAction SilentlyContinue)
    {
        Add-Content -Path $PROFILE -Value "`n"
        Add-Content -Path $PROFILE -Value "Invoke-Expression (&starship init powershell)"
    }

    if (Get-Command "zoxide" -ErrorAction SilentlyContinue)
    {
        Add-Content -Path $PROFILE -Value "`n"
        Add-Content -Path $PROFILE -Value "Invoke-Expression (& { (zoxide init powershell | Out-String) })"
    }

    Write-Host "Profile configured!"

}

Start-MainProccess
