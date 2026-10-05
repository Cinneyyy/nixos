-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
local mainMod = "SUPER"

-- Focus/open programs.
local function focus(program, class)
    local windows = hl.get_windows({ class = class })

    if #windows == 0 then
        hl.exec_cmd(program)
        return
    end

    if #windows == 1 then
        hl.dispatch(hl.dsp.focus({ window =  windows[1] }))
        return
    end

    local active = hl.get_active_window()
    for i, window in ipairs(windows) do
        if active and window.address == active.address then
            local next = windows[i % #windows + 1]
            hl.dispatch(hl.dsp.focus({ window = next }))
            return
        end
    end
end

local programShortcuts = {
    { "1", "dolphin", "org.kde.dolphin", },
    { "2", "firefox", },
    { "3", "discord", },
    { "4", "kitty", },
    { "5", "steam", },
}

for _, sh in ipairs(programShortcuts) do
    hl.bind(mainMod .. " + ALT + " .. sh[1], hl.dsp.exec_cmd(sh[2]))

    local class = sh[2]
    if #sh == 3 then
        class = sh[3]
    end

    hl.bind(mainMod .. " + " .. sh[1], function() focus(sh[2], class) end)
end

hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("hyprlauncher"))
hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd("rofi -show window"))

hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("pkill waybar && waybar"))

-- Screenhot.
hl.bind(mainMod .. "+ S", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'))

-- OS shortcuts.
hl.bind(mainMod .. " + F4", hl.dsp.window.close())
hl.bind(mainMod .. " + F11", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + DELETE", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- Window operations.
hl.bind(mainMod .. " + D", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + Q", hl.dsp.window.pseudo())

-- Move focus with arrow keys.
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + LEFT", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + RIGHT", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + UP", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + DOWN", hl.dsp.focus({ direction = "down" }))

-- Move windows with arrow keys.
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + LEFT", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + RIGHT", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + UP", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + DOWN", hl.dsp.window.move({ direction = "down" }))

-- Move / resize windows with lmb/rmb.
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
-- for i = 1, 10 do
--     local key = i % 10 -- 10 maps to key 0
--     hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i}))
--     hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
-- end

-- Example special workspace (scratchpad)
-- hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
-- hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
-- hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))


-- Lower/raise/mute volume.
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"),      { locked = true, repeating = true })

local muteSpeaker = hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
hl.bind("XF86AudioMute", muteSpeaker, { locked = true, repeating = true })
hl.bind(mainMod .. " + F10", muteSpeaker, { locked = true, repeating = true })

-- Mute microphone.
local muteMic = hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")
hl.bind("XF86AudioMicMute", muteMic, { locked = true, repeating = true })
hl.bind(mainMod .. " + F9", muteMic, { locked = true, repeating = true })

-- Requires playerctl
-- hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
-- hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
