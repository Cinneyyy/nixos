local hl = hl

hl.on("hyprland.start", function ()
    local programs = {
        "quickshell",
        "hyprpaper",

        "discord",
        "steam",

        "signal-desktop",
        "whatsapp-electron",
        "cinny0",

        "bitwarden",
    }

    hl.exec_cmd("kitty", { workspace = "1", })
    hl.exec_cmd("firefox", { workspace = "1 silent", })

    for _, program in ipairs(programs) do
        hl.exec_cmd(program)
    end
end)
