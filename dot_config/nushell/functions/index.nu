def Get-CodeWorkspace [] {}

def Set-TempEnvFromFile [file: string] {}

def Hola [] {}

def Zellij-Attach [] {}

def pw [...args: string] {
    let arg = $args | str join " "
    pwsh -c $"($arg)"
}

