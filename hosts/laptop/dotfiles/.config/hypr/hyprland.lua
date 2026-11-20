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

-- Brightness controls
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 1%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 1%-"))
hl.bind("SHIFT + XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 10%+"))
hl.bind("SHIFT + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10%-"))

-- Playerctl shortcuts.
hl.bind("XF86TouchpadToggle", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, repeating = false, })
hl.bind("XF86TouchpadOn", hl.dsp.exec_cmd("playerctl previous"), { locked = true, repeating = false, })
hl.bind("F23", hl.dsp.exec_cmd("playerctl next"), { locked = true, repeating = false, })

require("hyprland/init")
