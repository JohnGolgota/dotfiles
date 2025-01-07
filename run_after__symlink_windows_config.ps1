if ($IsWindows) {
    $nvimConfDir = (Join-Path $env:LOCALAPPDATA "nvim")
    if (-not (Test-Path $nvimConfDir)) {
        New-Item -Path $nvimConfDir -ItemType Junction -Value ${HOME}\.config\nvim
    }
    $wtConfDir = (Join-Path $env:LOCALAPPDATA "Packages" "Microsoft.WindowsTerminal_8wekyb3d8bbwe" "LocalState")
    if (-not (Test-Path $wtConfDir)) {
        New-Item -Path $wtConfDir -ItemType Junction -Value ${HOME}\.config\wt
    }
    $rioConfDir = (Join-Path $env:LOCALAPPDATA "rio")
    if (-not (Test-Path $rioConfDir)) {
        New-Item -Path $rioConfDir -ItemType Junction -Value ${HOME}\.config\rio
    }
    $helixConfDir = (Join-Path $env:APPDATA "helix")
    if (-not (Test-Path $helixConfDir)) {
        New-Item -Path $helixConfDir -ItemType Junction -Value ${HOME}\.config\helix
    }
}