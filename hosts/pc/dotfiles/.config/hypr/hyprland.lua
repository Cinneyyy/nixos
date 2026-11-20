hl.monitor({
    output = "DP-3",
    mode = "1920x1080@60",
    position = "0x0",
    scale = 1,
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@60",
    position = "1920x0",
    scale = 1,
})

numMonitors = 2

-- Power shortcuts.
local mainMod = "SUPER"
hl.bind(mainMod .. " + INSERT", hl.dsp.exec_cmd([[cvlc ~/.config/quickshell/sounds/cats/$(($RANDOM%8)).mp3 --gain 0.33 --play-and-exit]]))
hl.bind(mainMod .. " + HOME", hl.dsp.exec_cmd([[hyprshutdown -t "Shutting down..." -p "shutdown now"]]))
hl.bind(mainMod .. " + PRIOR", hl.dsp.exec_cmd([[hyprshutdown -t "Rebooting..." -p "reboot"]]))
hl.bind(mainMod .. " + DELETE", hl.dsp.exec_cmd([[systemctl suspend]]))
hl.bind(mainMod .. " + END", hl.dsp.exec_cmd([[pidof hyprlock || hyprlock]]))
hl.bind(mainMod .. " + NEXT", hl.dsp.exec_cmd([[hyprshutdown -t "Logging out..."]]))

require("hyprland/init")
