if ($IsWindows)
{
    $nvimConfDir = (Join-Path $env:LOCALAPPDATA "nvim")
    if (-not (Test-Path $nvimConfDir))
    {
        New-Item -Path $nvimConfDir -ItemType Junction -Value ${HOME}\.config\nvim
    }

    $rioConfDir = (Join-Path $env:LOCALAPPDATA "rio")
    if (-not (Test-Path $rioConfDir))
    {
        New-Item -Path $rioConfDir -ItemType Junction -Value ${HOME}\.config\rio
    }

    $helixConfDir = (Join-Path $env:APPDATA "helix")
    if (-not (Test-Path $helixConfDir))
    {
        New-Item -Path $helixConfDir -ItemType Junction -Value ${HOME}\.config\helix
    }

    $neovideConfDir = (Join-Path $env:APPDATA "neovide")
    if (-not (Test-Path $neovideConfDir))
    {
        New-Item -Path $neovideConfDir -ItemType Junction -Value ${HOME}\.config\neovide
    }


    $alacrittyConfDir = (Join-Path $env:APPDATA "alacritty")
    if (-not (Test-Path $alacrittyConfDir))
    {
        New-Item -Path $alacrittyConfDir -ItemType Junction -Value ${HOME}\.config\alacritty
    }

    $nuShellConfDir = (Join-Path $env:APPDATA "nushell")
    if (-not (Test-Path $nuShellConfDir))
    {
        New-Item -Path $nuShellConfDir -ItemType Junction -Value ${HOME}\.config\nushell
    }

    $yaziConfDir = (Join-Path $env:APPDATA "yazi")
    if (-not (Test-Path $yaziConfDir))
    {
        New-Item -Path $yaziConfDir -ItemType Junction -Value ${HOME}\.config\yazi
    }

    Get-Content -Path ${HOME}\.config\powershell\profile.ps1 | Set-Content -Path $PROFILE.CurrentUserAllHosts

}

if (-not ($isWindows))
{
    Write-Host "👍"
}