def Get-CodeWorkspace [] {}

def Set-TempEnvFromFile [file: string] {}

def Hola [] {
    let name = input "¿Cómo te llamas?: "
    print $"¡Hola ($name)!"
    curl ascii.live/donut
}

def Zellij-Attach [] {}

def pw [...args: string] {
    let arg = $args | str join " "
    pwsh -c $"($arg)"
}

