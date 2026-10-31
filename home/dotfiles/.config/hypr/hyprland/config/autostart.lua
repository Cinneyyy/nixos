hl.on("hyprland.start", function ()
    hl.exec_cmd("quickshell")
    hl.exec_cmd("hyprpaper")

    hl.exec_cmd("kitty", { workspace = "1", })
    hl.exec_cmd("firefox", { workspace = "1 silent", })

    hl.exec_cmd("steam")
    hl.exec_cmd("discord")
    hl.exec_cmd("signal-desktop")
    hl.exec_cmd("whatsapp-electron")
    hl.exec_cmd("bitwarden")
    hl.exec_cmd("fluffychat")
end)
