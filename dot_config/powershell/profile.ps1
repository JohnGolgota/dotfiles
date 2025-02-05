. ${HOME}/.config/a-cli/ACli-utils.ps1

Set-PSReadLineKeyHandler -Chord Ctrl+e -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert($env:EDITOR)
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

Set-PSReadLineKeyHandler -Chord Ctrl+q -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('exit')
}

Set-PSReadLineKeyHandler -Chord Ctrl+d -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('yazi')
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

