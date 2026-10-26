hl.on("hyprland.start", function ()
    hl.exec_cmd("quickshell")
    hl.exec_cmd("hyprpaper")

    hl.exec_cmd("kitty", { workspace = "1", })
    hl.exec_cmd("firefox", { workspace = "1 silent", })

    hl.exec_cmd("steam", { workspace = "2 silent", })
    hl.exec_cmd("discord", { workspace = "2 silent", })
    hl.exec_cmd("signal-desktop", { workspace = "3 silent", })
    hl.exec_cmd("whatsapp-electron", { workspace = "3 silent", })
    hl.exec_cmd("bitwarden", { workspace = "4 silent", })
end)
