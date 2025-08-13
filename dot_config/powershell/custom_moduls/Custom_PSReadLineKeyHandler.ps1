$currentMode = (Get-PSReadLineOption).EditMode

$editorHandler = {
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert($env:EDITOR)
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

$explorerHandler = {
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('yazi')
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

$exitHandler = {
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('exit')
}

$gituiHandler = {
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('gitui')
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

$ziHandler = {
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('zi')
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

if ($currentMode -eq 'Vi')
{

    Set-PSReadLineKeyHandler -Chord Ctrl+d -ViMode Command -ScriptBlock $exitHandler

    Set-PSReadLineKeyHandler -Chord Ctrl+e -ViMode Insert -ScriptBlock $editorHandler

    Set-PSReadLineKeyHandler -Chord Ctrl+q -ViMode Insert -ScriptBlock $explorerHandler
    Set-PSReadLineKeyHandler -Chord Ctrl+q -ViMode Command -ScriptBlock $explorerHandler

    Set-PSReadLineKeyHandler -Chord Ctrl+g -ViMode Insert -ScriptBlock $gituiHandler
    Set-PSReadLineKeyHandler -Chord Ctrl+g -ViMode Command -ScriptBlock $gituiHandler

    Set-PSReadLineKeyHandler -Chord Ctrl+f -ViMode Insert -ScriptBlock $ziHandler
    Set-PSReadLineKeyHandler -Chord Ctrl+f -ViMode Command -ScriptBlock $ziHandler

} else
{

    Set-PSReadLineKeyHandler -Chord Ctrl+d -ScriptBlock $exitHandler

    Set-PSReadLineKeyHandler -Chord Ctrl+e -ScriptBlock $editorHandler

    Set-PSReadLineKeyHandler -Chord Ctrl+q -ScriptBlock $explorerHandler

    Set-PSReadLineKeyHandler -Chord Ctrl+g -ScriptBlock $gituiHandler

    Set-PSReadLineKeyHandler -Chord Ctrl+f -ScriptBlock $ziHandler

}
