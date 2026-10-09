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
        hl.dispatch(hl.dsp.focus({ window = windows[1] }))
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
    { "1", "nautilus", "org.gnome.Nautilus", },
    { "2", "firefox", },
    { "3", "discord", },
    { "4", "kitty", },
    { "5", "steam", },
}

for _, sh in ipairs(programShortcuts) do
    hl.bind(mainMod .. " + CTRL + " .. sh[1], hl.dsp.exec_cmd(sh[2]))

    local class = sh[2]
    if #sh == 3 then
        class = sh[3]
    end

    hl.bind(mainMod .. " + " .. sh[1], function() focus(sh[2], class) end)
end

-- Hyprlauncher
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("hyprlauncher"))

-- Reload keybinds
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("pkill quickshell; qs"))

-- Screenhot.
hl.bind(mainMod .. "+ S", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'))

-- OS shortcuts.
hl.bind(mainMod .. " + F4", hl.dsp.window.close())
hl.bind(mainMod .. " + F11", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + DELETE", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- Window operations.
-- hl.bind(mainMod .. " + Q", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + D", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))

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
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true, })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, })

-- Lower/raise/mute volume.
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+"), { locked = true, repeating = true, })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"), { locked = true, repeating = true, })
hl.bind("SHIFT + XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 10%+"), { locked = true, repeating = true, })
hl.bind("SHIFT + XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%-"), { locked = true, repeating = true, })
-- hl.bind("CTRL + XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+"), { locked = true, repeating = true, })
-- hl.bind("CTRL + XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"), { locked = true, repeating = true, })
-- hl.bind("ALT + XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 10%+"), { locked = true, repeating = true, })
-- hl.bind("ALT + XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"), { locked = true, repeating = true, })

hl.bind(mainMod .. " + XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SOURCE@ 1%+"), { locked = true, repeating = true, })
hl.bind(mainMod .. " + XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 1%-"), { locked = true, repeating = true, })
hl.bind(mainMod .. "+ SHIFT + XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SOURCE@ 10%+"), { locked = true, repeating = true, })
hl.bind(mainMod .. "+ SHIFT + XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 10%-"), { locked = true, repeating = true, })

local muteSpeaker = hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
hl.bind("XF86AudioMute", muteSpeaker, { locked = true, repeating = false })

local muteMic = hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")
hl.bind("XF86AudioMicMute", muteMic, { locked = true, repeating = false })
hl.bind(mainMod .. "+ XF86AudioMute", muteMic, { locked = true, repeating = false })

-- Media controls
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true, repeating = false, })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, repeating = false, })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, repeating = false, })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true, repeating = false, })

-- Brightness controls
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 1%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 1%-"))
hl.bind("SHIFT + XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 10%+"))
hl.bind("SHIFT + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10%-"))

-- Quickshell
-- hl.bind(mainMod .. " + adiaeresis", hl.dsp.exec_cmd("notify-send 'hate' 'let me tell you how much ive come to hate you since i began to live.'"))
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("qs ipc call notifications dismissAll"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("qs ipc call volumeMixer toggle"))

-- Discord
hl.bind("CTRL + F9", hl.dsp.send_shortcut({
    mods = "CTRL + SHIFT",
    key = "M",
    window = "class:^discord$",
}))
hl.bind("CTRL + F10", hl.dsp.send_shortcut({
    mods = "CTRL + SHIFT",
    key = "D",
    window = "class:^discord$",
}))

-- Workspaces
for i = 1, 4 do
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.focus({ workspace = i, }))
    hl.bind("ALT + SHIFT + " .. i, hl.dsp.window.move({ workspace = i, }))
end

hl.bind(mainMod .. " + N", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + M", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))

hl.bind(mainMod .. " + SHIFT + N", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + SHIFT + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
