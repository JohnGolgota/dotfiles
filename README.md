# dotfiles

uso GitHub como nube xd

Ya no se que hacer con esto, pero me gusta

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
