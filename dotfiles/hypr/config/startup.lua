hl.on("hyprland.start", function ()
    hl.exec_cmd("quickshell")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")

    hl.exec_cmd("kitty")
    hl.exec_cmd("firefox")

    hl.exec_cmd("steam -silent")
    hl.exec_cmd("discord")
    hl.exec_cmd("signal-desktop")
    hl.exec_cmd("whatsapp-electron")
end)
