if ($IsWindows)
{
    $dotConfigDir = (Join-Path $HOME ".config")

    $appConfigs = @{
        nvim = $env:LOCALAPPDATA
        rio = $env:LOCALAPPDATA
        helix = $env:APPDATA
        neovide = $env:APPDATA
        alacritty = $env:APPDATA
        nushell = $env:APPDATA
        yazi = $env:APPDATA
    }

    foreach ($appConfig in $appConfigs.GetEnumerator())
    {
        $targetDir = Join-Path $appConfig.Value $appConfig.Key
        $sourceDir = Join-Path $dotConfigDir $appConfig.Key

        if (-not (Test-Path $targetDir))
        {
            try
            {
                New-Item -Path $targetDir -ItemType Junction -Value $sourceDir
            } catch
            {
                Write-Warning "Error while creating junction for $targetDir"
            }
        }
    }

    $sourceProfile = Join-Path $dotConfigDir "powershell" "profile.ps1"
    if (Test-Path $sourceProfile)
    {
        Copy-Item -Path $sourceProfile -Destination $PROFILE.CurrentUserAllHosts -Force
    }

}

if (-not ($isWindows))
{
    Write-Host "👍"
}
