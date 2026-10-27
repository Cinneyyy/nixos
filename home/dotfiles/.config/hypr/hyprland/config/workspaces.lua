-- numMonitors is defined in the host file importing hyprland.lua

local function getMonitor(workspace)
    if workspace == 1 or numMonitors == 1 then
        return 0
    end

    return (workspace-1) % (numMonitors-1) + 1;
end

local function getIsDefault(workspace, monitor)
    return workspace-1 == monitor
end

local numWorkspaces = 4
for i = 1, numWorkspaces do
    local monitor = getMonitor(i)
    local isDefault = getIsDefault(i, monitor)

    hl.workspace_rule({
        workspace = tostring(i),
        monitor = monitor,
        default = isDefault,
        persistent = true,
    })
end

hl.on("hyprland.start", function ()
    for i = numMonitors, 1, -1 do
        hl.exec_cmd(
            "hyprctl eval 'hl.dispatch(hl.dsp.focus({ workspace = '" .. tostring(i) .. ", }))'")
    end
end)

-- #: name (autostart)
-- 1: primary (kitty, firefox)
-- 2: secondary (discord, steam)
-- 3: messaging (whatsapp, signal)
-- 4: misc (bitwarden)

hl.window_rule({
    match = {
        class = ".*(discord|steam).*",
    },
    workspace = "2",
    no_initial_focus = true,
})
hl.window_rule({
    match = {
        title = ".*[Ss]team.*",
    },
    workspace = "2",
})
hl.window_rule({
    match = {
        class = ".*(whatsapp|signal).*",
    },
    workspace = "3",
    no_initial_focus = true
})
hl.window_rule({
    match = {
        class = ".*bitwarden.*",
    },
    workspace = "4",
    no_initial_focus = true
})

hl.window_rule({
    match = {
        title = "Steam Settings",
    },
    float = true,
    center = true,
})

hl.window_rule({
    match = {
        class = "steam_app_[0-9]+",
    },
    content = "game",
    workspace = "1",
})
