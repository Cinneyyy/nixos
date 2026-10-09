for i = 1, 4 do
    hl.workspace_rule({
        workspace = tostring(i),
        persistent = true,
        default = true,
    })
end

-- #: name (autostart)
-- 1: primary (kitty, firefox)
-- 2: secondary (discord, steam)
-- 3: bitwarden, whatsapp, signal
-- 4: misc

hl.window_rule({
    match = { class = "discord|steam", },
    workspace = 2,
})

hl.window_rule({
    match = { class = "bitwarden|whatsapp*|signal*", },
    workspace = 3
})
