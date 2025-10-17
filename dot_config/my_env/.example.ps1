# This file is used to store local environment variables.
# It is not commited to git.

$LocalCustomObject = @{
    "paths"     = @()
    "common"    = @{}
    "no_quotes" = @{}
    "darwin"    = @{
        "paths"     = @()
        "common"    = @{}
        "no_quotes" = @{}
    }
    "linux"     = @{
        "paths"     = @()
        "common"    = @{}
        "no_quotes" = @{}
    }
    "win"       = @{
        "paths"     = @()
        "common"    = @{}
        "no_quotes" = @{}
    }
}

# can rewrite base environment variables like this
# $CustomObject.linux.paths = @()
# Copy-Item .example.ps1 local.ps1