module customCommands {
    def rep-opts [] {
        ["a1" "a2" "a3"]
    }
    export def rep [r: string@rep-opts] {
        print $"rep: ($r)"
    }
}
