$MY_PROFILE = Join-Path ${HOME} ".config" "powershell" "custom_moduls" "Envs.ps1"
$NU_PROFILE = Join-Path ${HOME} ".config" "nushell" "env.nu"
$ZSH_PROFILE = Join-Path ${HOME} ".config" "shell_setup" "common" "001-env.sh"
$DOT_ENVFILE = Join-Path ${HOME} ".config" "my_env" "101.env"
$basePath = Join-Path ${HOME} ".config" "my_env" "001.ps1"
$localPath = Join-Path ${HOME} ".config" "my_env" "local.ps1"

if (Test-Path $PROFILE) {
    . $localPath
}
. $basePath

function Build-CommonEnv
{
    param (
        [hashtable]$json
    )

    $CommonEnv = $json.common
    $Paths = $json.paths
    $NoQuotes = $json.no_quotes
    if ($IsMacOS)
    {
        $CommonEnv += $json.darwin.common
        $Paths += $json.darwin.paths
        $Paths += $json.linux.paths
        $NoQuotes += $json.darwin.no_quotes
        $NoQuotes += $json.linux.no_quotes
    }

    if ($IsLinux)
    {
        $CommonEnv += $json.linux.common
        $Paths += $json.linux.paths
        $NoQuotes += $json.linux.no_quotes
    }

    if ($IsWindows)
    {
        $CommonEnv += $json.win.common
        $Paths += $json.win.paths
        $NoQuotes += $json.win.no_quotes
    }

    return @{
        Common   = $CommonEnv
        Paths    = $Paths
        NoQuotes = $NoQuotes
    }
}

function Set-NuProfile
{
    param (
        [hashtable]$json
    )

    $hardcoded_config = @(
        "`$env.config.show_banner = false",
        "`$env.config.buffer_editor = `$env.MY_EDITOR",
        "`$env.config.edit_mode = `"vi`""
    )

    # Clean nu profile
    if (Test-Path $NU_PROFILE)
    {
        Set-Content -Path $NU_PROFILE -Value ""
    }

    Add-Content -Path $NU_PROFILE -Value "load-env {" -Force

    $json.Common.GetEnumerator() | ForEach-Object {
        Add-Content -Path $NU_PROFILE -Value "    $($_.Key): '$($_.Value)'" -Force
    }

    Add-Content -Path $NU_PROFILE -Value "}" -Force
    #new line
    Add-Content -Path $NU_PROFILE -Value "" -Force

    $hardcoded_config | ForEach-Object {
        Add-Content -Path $NU_PROFILE -Value $_ -Force
    }
    Add-Content -Path $NU_PROFILE -Value "" -Force

    Add-Content -Path $NU_PROFILE -Value "`$env.PATH ++= [" -Force

    $json.Paths | ForEach-Object {
        Add-Content -Path $NU_PROFILE -Value "    '$_'," -Force
    }

    Add-Content -Path $NU_PROFILE -Value "]" -Force

}

function Set-ZshProfile
{
    param (
        [hashtable]$json
    )

    # Clean zsh profile
    if (Test-Path $ZSH_PROFILE)
    {
        Set-Content -Path $ZSH_PROFILE -Value ""
    }

    $separator = if ($IsWindows)
    { ";"
    } else
    { ":"
    }
    $path_value = ($json.Paths -join $separator) + $separator + '$PATH'
    Add-Content -Path $ZSH_PROFILE -Value "export PATH=`"$path_value`"" -Force

    Add-Content -Path $ZSH_PROFILE -Value "" -Force

    $json.Common.GetEnumerator() | ForEach-Object {
        Add-Content -Path $ZSH_PROFILE -Value "export $($_.Key)=`"$($_.Value)`"" -Force
    }

    Add-Content -Path $ZSH_PROFILE -Value "" -Force

    $json.NoQuotes.GetEnumerator() | ForEach-Object {
        Add-Content -Path $ZSH_PROFILE -Value "export $($_.Key)=$($_.Value)" -Force
    }
    Add-Content -Path $ZSH_PROFILE -Value "" -Force
}

function Set-PSProfile
{
    param (
        [hashtable]$json
    )

    # Clean ps profile
    if (Test-Path $MY_PROFILE)
    {
        Set-Content -Path $MY_PROFILE -Value ""
    }
    $separator = if ($IsWindows)
    { ";"
    } else
    { ":"
    }
    $path_value = ($json.Paths -join $separator) + $separator + '$Env:PATH'
    Add-Content -Path $MY_PROFILE -Value "`$Env:PATH = `"$path_value`"" -Force
    Add-Content -Path $MY_PROFILE -Value "" -Force

    $json.Common.GetEnumerator() | ForEach-Object {
        Add-Content -Path $MY_PROFILE -Value "`$Env:$($_.Key) = `"$($_.Value)`"" -Force
    }
    Add-Content -Path $MY_PROFILE -Value "" -Force

    $json.NoQuotes.GetEnumerator() | ForEach-Object {
        Add-Content -Path $MY_PROFILE -Value "`$Env:$($_.Key) = $($_.Value)" -Force
    }
    Add-Content -Path $MY_PROFILE -Value "" -Force
}

function Set-DotEnvFile
{
    param (
        [hashtable]$json
    )

    # Clean .env file
    if (Test-Path $DOT_ENVFILE)
    {
        Set-Content -Path $DOT_ENVFILE -Value ""
    }

    $separator = if ($IsWindows)
    { ";"
    } else
    { ":"
    }
    $path_value = ($json.Paths -join $separator) + $separator + '$PATH'
    Add-Content -Path $DOT_ENVFILE -Value "PATH=`"$path_value`"" -Force
    Add-Content -Path $DOT_ENVFILE -Value "" -Force

    $json.Common.GetEnumerator() | ForEach-Object {
        Add-Content -Path $DOT_ENVFILE -Value "$($_.Key)=`"$($_.Value)`"" -Force
    }
    Add-Content -Path $DOT_ENVFILE -Value "" -Force

    $json.NoQuotes.GetEnumerator() | ForEach-Object {
        Add-Content -Path $DOT_ENVFILE -Value "$($_.Key)=$($_.Value)" -Force
    }
    Add-Content -Path $DOT_ENVFILE -Value "" -Force

}

function Main
{
    $CommonEnv = Build-CommonEnv -json $CustomObject

    if ($LocalCustomObject) {
        Write-Host "Hay local"
        $LocalCommonEnv = Build-CommonEnv -json $LocalCustomObject

        $CommonEnv.Common += $LocalCommonEnv.Common
        $CommonEnv.Paths += $LocalCommonEnv.Paths
        $CommonEnv.NoQuotes += $LocalCommonEnv.NoQuotes
    }

    Set-NuProfile -json $CommonEnv
    Set-ZshProfile -json $CommonEnv
    Set-PSProfile -json $CommonEnv
    Set-DotEnvFile -json $CommonEnv
}

Main

