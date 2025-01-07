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
}

if (-not ($isWindows))
{
    Write-Host "👍"
}