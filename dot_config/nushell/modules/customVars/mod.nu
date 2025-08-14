const VarsTempPath = $nu.home-path + "/temp"
const VarsTempFilePath = $VarsTempPath + "/vars.nu"
const VarsTempFileJsonPath = $VarsTempFilePath + ".json"

# test path
if ($VarsTempFilePath | path exists) {} else {
    if ($VarsTempPath | path exists) {} else {
        mkdir $VarsTempPath
    }
    print "Creating temp file"
    touch $VarsTempFilePath
}

def Write-CustomVars [vars: string] {
    print $"Writing in ($VarsTempFilePath)"
    $"($vars)\n" | save -a $VarsTempFilePath
}

def Spread-CustomVars [] {
    open $VarsTempFilePath | from json
}

def wrii [
    --name (-n): string
    --val (-v): any
] {
    mut bk = open $VarsTempFileJsonPath
    mut safe_bk = $bk | merge []
    $safe_bk = $safe_bk | insert 0 {n: $name,v: $val}
    $safe_bk | to json | save -f $VarsTempFileJsonPath
}

$env.config.hooks = {
    pre_execution: [
        {
            let repl_commandline = (commandline)
            if ((([$repl_commandline] | where $it =~ "^(let|mut|const)") | length) > 0) {} else {
                return
            }
            print $"save: ($repl_commandline)?"
            let user_input = (input --default 1)
            if ($user_input == "1") {
                Write-CustomVars $repl_commandline
            }
        }
    ]
}
