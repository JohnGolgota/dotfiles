function Set-CustomModulesImports
{
    Add-Content -Path $PROFILE -Value "`n"
    Add-Content -Path $PROFILE -Value ". $(Join-Path ${HOME} ".config" "powershell" "custom_moduls" "Envs.ps1")"
    Add-Content -Path $PROFILE -Value ". $(Join-Path ${HOME} ".config" "powershell" "custom_moduls" "Custom_Functions.ps1")"
    Add-Content -Path $PROFILE -Value ". $(Join-Path ${HOME} ".config" "powershell" "custom_moduls" "PS_Alias.ps1")"
    Add-Content -Path $PROFILE -Value ". $(Join-Path ${HOME} ".config" "powershell" "custom_moduls" "CustomVarsModule.ps1")"
    Add-Content -Path $PROFILE -Value ". $(Join-Path ${HOME} ".config" "powershell" "custom_moduls" "Custom_PSReadLineKeyHandler.ps1")"
}

function Set-ThirdPartyConfig
{
    $thirdPartyEnvs = @{
        "fnm" = "fnm env --use-on-cd | Out-String | Invoke-Expression"
        "starship" = "Invoke-Expression (&starship init powershell)"
        "zoxide" = "Invoke-Expression (& { (zoxide init powershell | Out-String) })"
    }

    foreach ($program in $thirdPartyEnvs.Keys)
    {
        Write-Host "Setting up $program"
        if (Get-Command $program -ErrorAction SilentlyContinue)
        {
            Add-Content -Path $PROFILE -Value "`n"
            Add-Content -Path $PROFILE -Value $thirdPartyEnvs[$program]
            Write-Host "$program Set up!"
        } else
        {
            Write-Host "$program not found!"
        }
    }
}

function Start-MainProccess
{

    Write-Host "Configuring profile..."
    if (-not (Test-Path $PROFILE))
    {
        Write-Host "Profile not found, creating..."
        New-Item -Path $PROFILE -ItemType File
    }

    Write-Host "Cleaning profile..."
    Set-Content -Path $PROFILE -Value ""

    # Config PS region
    $editMode = "Vi"
    Add-Content -Path $PROFILE -Value "Set-PSReadLineOption -EditMode $editMode"

    # Imports
    Set-CustomModulesImports

    # Third party Envs
    Set-ThirdPartyConfig

    Write-Host "Profile configured!"

}

Start-MainProccess
