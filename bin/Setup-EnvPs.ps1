param(
    [Parameter(Mandatory=$true)]
    [string]$PathEnvFile
)
try {
    $content = Get-Content -Path $PathEnvFile

    $content | ForEach-Object {
        $line = $_
        if ($line -match "^(.*?)=(.*)$") {
            $key = $matches[1]
            $value = $matches[2]
            [Environment]::SetEnvironmentVariable($key, $value)
        }
    }
}
catch {
    write-host "Error: $($_.Exception.Message)"
    exit 1
}