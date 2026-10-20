# dotfiles

Convención de organización por rangos numéricos de carga (numeric load-order convention). Cada rango Nxx representa una categoría lógica de scripts y, al mismo tiempo, define en qué momento se ejecutan.


## Setup Description

| Rango | Categoría | Propósito |
| - | - | - |
| 1xx | Core / Bootstrap | Preparación del entorno, variables esenciales y rutas base. |
| 2xx | Defaults | Valores predeterminados, opciones generales y configuración inicial. |
| 3xx | Environment | Variables de entorno, PATH, locales y configuración de sesión. |
| 4xx | Integrations / Third-party | Configuraciones e inicializadores instalados por herramientas externas, como fnm, starship, zoxide o fzf. |
| 5xx | Shell Modules | Funcionalidades comunes: aliases, funciones, completado y utilidades propias. |
| 6xx | Personal Config | Tus preferencias, ajustes personales y comportamiento específico de tu entorno. |
| 7xx | Overrides | Modificaciones que prevalecen sobre los defaults o la configuración de terceros. |
| 8xx | Interactive / UI | Prompt, colores, mensajes de bienvenida y personalización visual de la terminal. |
| 9xx | Finalization | Ajustes finales, limpieza y acciones que deben ejecutarse al terminar la inicialización. |

### Illustrative example

```sh
shell/
├── 1xx-bootstrap.sh
├── 2xx-defaults.sh
├── 3xx-environment.sh
├── 4xx-third-party.sh
├── 4xx-nvm.sh
├── 4xx-starship.sh
├── 4xx-zoxide.sh
├── 5xx-aliases.sh
├── 5xx-functions.sh
├── 5xx-completions.sh
├── 6xx-personal.sh
├── 7xx-overrides.sh
├── 8xx-prompt.sh
└── 9xx-finalize.sh
```

## Chezmoi

### Data

#### Git

```pwsh
chezmoi secret keyring set --service=github --user=$GITHUB_USER
```

### Secrets

TODO, summary: un script de entorno con datos privados
#### S
En el archivo `.chezmoi.toml` pongo:

```toml
[secret]
    command = "pwsh"
    args = ["-NoLogo", "-ExecutionPolicy", "Bypass", "-File", "{{ .chezmoi.homeDir }}/secrets/get-secrets.ps1"]
```

Y en el archivo `get-secrets.ps1` tengo:
```pwsh
$secrets = @{
	git = @{
		signingkey = ""
	}
}
$secrets | ConvertTo-Json
```
Con eso puedo usar:
```pwsh
{{ $config := secretJSON }}
signingkey = {{ $config.git.signingkey }}
```
por ejemplo. o alg
