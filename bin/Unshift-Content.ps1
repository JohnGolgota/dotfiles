param (
    [string]$content,
    [string]$file
)

$contentCurrent = Get-Content $file

$newContent = $content + "`n" + $contentCurrent

Set-Content -Path $file -Value $newContent
