local monitorScale = 1.25

hl.monitor({
    output = "eDP-1",
    mode = "1920x1080@60",
    position = "0x0",
    scale = monitorScale,
})

hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})

hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("hyprlock"), { locked = true, })

require("hyprland/hyprland")

-- local div = math.floor(100 * monitorScale)
-- hl.on("hyprland.start", function ()
--     hl.exec_cmd("qs ipc call volumeMixer setX $(( $(qs ipc call volumeMixer getX) * 100 / " .. monitorScale .. " ))")
-- end)
