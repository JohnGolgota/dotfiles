$env.config.keybindings ++= [
    {
        name: zi_binding
        modifier: "CONTROL"
        keycode: "char_f"
        mode: [emacs, vi_normal, vi_insert]
        event: [
            { edit: Clear }
            {
                edit: InsertString,
                value: "zi"
            }
            { send: Enter }
        ]
    }
    {
        name: yazi_binding
        modifier: "CONTROL"
        keycode: "char_q"
        mode: [emacs, vi_normal, vi_insert]
        event: [
            { edit: Clear }
            {
                edit: InsertString,
                value: $env.MY_EXPLORER
            }
            { send: Enter }
        ]
    }
    {
        name: edit_binding
        modifier: "CONTROL"
        keycode: "char_e"
        mode: [emacs, vi_normal, vi_insert]
        event: [
            { edit: Clear }
            {
                edit: InsertString,
                value: $env.config.buffer_editor
            }
            { send: Enter }
        ]
    }
    {
        name: gitui_binding
        modifier: "CONTROL"
        keycode: "char_g"
        mode: [emacs, vi_normal, vi_insert]
        event: [
            { edit: Clear }
            {
                edit: InsertString,
                value: $env.MY_GITUI
            }
            { send: Enter }
        ]
    }
]
