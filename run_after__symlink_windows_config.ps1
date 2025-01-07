if ($IsWindows) {
    $nvimConfDir = (Join-Path $env:LOCALAPPDATA "nvim")
    if (-not (Test-Path $nvimConfDir)) {
        New-Item -Path $nvimConfDir -ItemType Junction -Value ${HOME}\.config\nvim
    }
    $rioConfDir = (Join-Path $env:LOCALAPPDATA "rio")
    if (-not (Test-Path $rioConfDir)) {
        New-Item -Path $rioConfDir -ItemType Junction -Value ${HOME}\.config\rio
    }
    $helixConfDir = (Join-Path $env:LOCALAPPDATA "helix")
    if (-not (Test-Path $helixConfDir)) {
        New-Item -Path $helixConfDir -ItemType Junction -Value ${HOME}\.config\helix
    }
}

if (-not ($isWindows)) {
    Write-Host "👍"
}