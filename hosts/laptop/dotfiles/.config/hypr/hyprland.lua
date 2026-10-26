local monitorScale = 1.20

hl.monitor({
    output = "eDP-1",
    mode = "1920x1080@60",
    position = "0x0",
    scale = monitorScale,
})

numMonitors = 1

hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})

hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("hyprlock"), { locked = true, })

require("hyprland/hyprland")
