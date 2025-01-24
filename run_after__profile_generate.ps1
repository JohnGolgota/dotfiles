function Set-NoWindowsPath
{
    $Paths = @(
        "${HOME}/.local/share/bob/nvim-bin",
        "${HOME}/.deno/bin"
        "${HOME}/bin"
        "${HOME}/.cargo/bin"
    )
    $NewPath = $Paths -join ':'

    Add-Content -Path $PROFILE -Value "`$Env:PATH = `"${NewPath}:`$Env:PATH`""
}

function Set-LinuxEnvs
{
    Set-NoWindowsPath
}

function Set-MacOSEnvs
{
    $Paths = @(
        "/opt/homebrew/opt/openjdk/bin",
        "/opt/homebrew/bin",
        "/opt/homebrew/sbin",
        "/Applications/Docker.app/Contents/Resources/bin",
        "${HOME}/.local/share/pnpm",
        "${HOME}/.bun/bin",
        "${HOME}/.nix-profile/bin",
        "/nix/var/nix/profiles/default/bin"
    )
    $NewPath = $Paths -join ':'
    Add-Content -Path $PROFILE -Value "`n`$Env:PATH = `"${NewPath}:`$Env:PATH`""

    Set-NoWindowsPath

    Add-Content -Path $PROFILE -Value "`n`$Env:GPG_TTY = `$(tty)"
}

function Set-CustomModulesImports
{

    Add-Content -Path $PROFILE -Value "`n. $(Join-Path ${HOME} ".config" "powershell" "custom_moduls" "Custom_Functions.ps1")"
    Add-Content -Path $PROFILE -Value ". $(Join-Path ${HOME} ".config" "powershell" "custom_moduls" "PS_Alias.ps1")"
    Add-Content -Path $PROFILE -Value ". $(Join-Path ${HOME} ".config" "powershell" "custom_moduls" "CustomVarsModule.ps1")"

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
    Add-Content -Path $PROFILE -Value "Set-PSReadLineOption -EditMode Windows"

    # Imports
    Set-CustomModulesImports

    # extra envs
    if ($IsLinux)
    {
        Set-LinuxEnvs
    }

    if ($IsMacOS)
    {
        Set-MacOSEnvs
    }

    # others programs configs
    if (Get-Command "fnm" -ErrorAction SilentlyContinue)
    {
        Add-Content -Path $PROFILE -Value "`nfnm env --use-on-cd | Out-String | Invoke-Expression"
    }

    if (Get-Command "starship" -ErrorAction SilentlyContinue)
    {
        Add-Content -Path $PROFILE -Value "`nInvoke-Expression (&starship init powershell)"
    }

    if (Get-Command "zoxide" -ErrorAction SilentlyContinue)
    {
        Add-Content -Path $PROFILE -Value "`nInvoke-Expression (& { (zoxide init powershell | Out-String) })"
    }

    Write-Host "Profile configured!"

}

Start-MainProccess