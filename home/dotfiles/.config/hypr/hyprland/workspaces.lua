-- numMonitors is defined in the host file importing hyprland.lua
local numMonitors = numMonitors
local hl = hl

local function getMonitor(workspace)
    if workspace == 1 or numMonitors == 1 then
        return 0
    end

    return (workspace-1) % (numMonitors-1) + 1;
end

local function getIsDefault(workspace, monitor)
    return workspace-1 == monitor
end

local numWorkspaces = 5
for i = 1, 9 do
    local monitor = getMonitor(i)
    local isDefault = getIsDefault(i, monitor)
    local isPersistent = i <= numWorkspaces

    hl.workspace_rule({
        workspace = tostring(i),
        monitor = tostring(monitor),
        default = isDefault,
        persistent = isPersistent,
    })

    if i > 1 then
        hl.workspace_rule({
            workspace = tostring(i),
            layout = "master",
        })
    end
end

hl.on("hyprland.start", function ()
    for i = numMonitors, 1, -1 do
        hl.exec_cmd("hyprctl eval 'hl.dispatch(hl.dsp.focus({ workspace = '" .. tostring(i) .. ", }))'")
    end
end)

-- #: name (autostart)
-- 1: primary (kitty, firefox)
-- 2: secondary (discord, steam)
-- 3: messaging (whatsapp, signal, matrix)
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
        class = ".*(whatsapp|signal|cinny|element).*",
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
        class = ".*(steam_app_[0-9]+|minecraft).*",
    },
    content = "game",
    workspace = "1",
})
