local monitorScale = 1.2

hl.monitor({
    output = "eDP-1",
    mode = "1920x1080@60",
    position = "0x0",
    scale = monitorScale,
})

require("hyprland/hyprland")

-- local div = math.floor(100 * monitorScale)
-- hl.on("hyprland.start", function ()
--     hl.exec_cmd("qs ipc call volumeMixer setX $(( $(qs ipc call volumeMixer getX) * 100 / " .. monitorScale .. " ))")
-- end)
