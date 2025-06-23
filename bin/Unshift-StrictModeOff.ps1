function Write-StrictModeOff {
    param(
        [Parameter(Mandatory = $true)]
        [string]$dbName 
    )

    return @"
SET GLOBAL innodb_strict_mode=OFF;
USE ``$dbName``;
"@
}

function Get-SqlScripts {
    param(
        [string]$dir
    )
    $scripts = Get-ChildItem -Path $dir -Filter *.sql
    return $scripts
}

function Get-DBName {
    param(
        [string]$file
    )
    $fileName = Split-Path -Path $file -Leaf
    $dbName = $fileName.Split(".")[0]
    return $dbName
}

function Update-SqlScript {  
    param(
        [string]$unshiftContent,
        [string]$file
    )
    $CurrentContent = Get-Content -Path $file
    $newContent = $unshiftContent + "`n" + $CurrentContent

    Set-Content -Path $file -Value $newContent
}

Get-SqlScripts -dir ".\scripts\" | ForEach-Object {
    $dbName = Get-DBName -file $_.FullName
    $unshiftContent = Write-StrictModeOff -dbName $dbName
    Update-SqlScript -unshiftContent $unshiftContent -file $_.FullName
}