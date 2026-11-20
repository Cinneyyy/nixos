local hl = hl

local function osDsp(key, dsp, flags, noSuper)
    if noSuper then
        hl.bind(key, dsp, flags)
    else
        hl.bind("SUPER + " .. key, dsp, flags)
    end
end

local function osExec(key, cmd, flags, noSuper)
    osDsp(key, hl.dsp.exec_cmd(cmd), flags, noSuper)
end

-- Launcher.
osExec("X", "qs ipc call launcher toggle")

-- Reload keybinds.
osExec("I", "hyprctl reload")
osExec("O", "pkill quickshell; qs")

-- Quick utils (screenshot, colour picker).
osExec("S", "grimblast --freze copy area")
osExec("B", [[
    grim -g "$(slurp -p)" -t ppm -
    | magick - -format "%[pixel:p{0,0}]" txt:-
    | grep -oE "#[0-9A-F]{6}"
    | tr '[:upper:]' '[:lower:]'
    | wl-copy -n
]])

-- Window actions.
osDsp("A", hl.dsp.window.close())
osDsp("Z", hl.dsp.window.fullscreen())
osDsp("P", hl.dsp.window.pseudo())
osDsp("D", hl.dsp.layout("togglesplit")) -- dwindle only.
osDsp("F", hl.dsp.window.float({ action = "toggle", }))

-- Move focus.
local function osMoveFocus(key, dir)
    osDsp(key, hl.dsp.focus({
        direction = dir,
    }))
end
osMoveFocus("H", "left")
osMoveFocus("J", "down")
osMoveFocus("K", "up")
osMoveFocus("L", "right")
osMoveFocus("LEFT", "left")
osMoveFocus("DOWN", "down")
osMoveFocus("UP", "up")
osMoveFocus("RIGHT", "right")

-- Resize windows with arrow keys.
local function osResize(key, x, y, step)
    osDsp(key, hl.dsp.window.resize({
        x = step * x,
        y = step * y,
        relative = true,
    }), {
        repeating = true,
    })
end

local smallStep = 25
osResize("ALT + H", -1, 0, smallStep)
osResize("ALT + L", 1, 0, smallStep)
osResize("ALT + J", 0, 1, smallStep)
osResize("ALT + K", 0, -1, smallStep)
osResize("ALT + LEFT", -1, 0, smallStep)
osResize("ALT + RIGHT", 1, 0, smallStep)
osResize("ALT + DOWN", 0, 1, smallStep)
osResize("ALT + UP", 0, -1, smallStep)

local bigStep = 150
osResize("CTRL + H", -1, 0, bigStep)
osResize("CTRL + L", 1, 0, bigStep)
osResize("CTRL + J", 0, 1, bigStep)
osResize("CTRL + K", 0, -1, bigStep)
osResize("CTRL + LEFT", -1, 0, bigStep)
osResize("CTRL + RIGHT", 1, 0, bigStep)
osResize("CTRL + DOWN", 0, 1, bigStep)
osResize("CTRL + UP", 0, -1, bigStep)

-- Move / resize windows with lmb/rmb.
osDsp("mouse:272", hl.dsp.window.drag(), { mouse = true, })
osDsp("mouse:273", hl.dsp.window.resize(), { mouse = true, })

-- Change volume.
local function volumeEvt(key, dev, step)
    osExec(key, "wpctl set-volume -l 1 @DEFAULT_AUDIO_" .. dev .. "@ " .. step, {
        locked = true,
        repeating = true,
    }, true)
end

volumeEvt("XF86AudioRaiseVolume", "SINK", "1%+")
volumeEvt("XF86AudioLowerVolume", "SINK", "1%-")
volumeEvt("SHIFT + XF86AudioRaiseVolume", "SINK", "10%+")
volumeEvt("SHIFT + XF86AudioLowerVolume", "SINK", "10%-")

volumeEvt("SUPER + XF86AudioRaiseVolume", "SOURCE", "1%+")
volumeEvt("SUPER + XF86AudioLowerVolume", "SOURCE", "1%-")
volumeEvt("SUPER + SHIFT + XF86AudioRaiseVolume", "SOURCE", "10%+")
volumeEvt("SUPER + SHIFT + XF86AudioLowerVolume", "SOURCE", "10%-")

-- Mute.
osExec("XF86AudioMute", "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle", { locked = true, })
osExec("XF86AudioMicMute", "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle", { locked = true, })

-- Media controls (required playerctl).
osExec("XF86AudioNext", "playerctl next", { locked = true, })
osExec("XF86AudioPrev", "playerctl previous", { locked = true, })
osExec("XF86AudioPause", "playerctl play-pause", { locked = true, })
osExec("XF86AudioPlay", "playerctl play-pause", { locked = true, })

-- Quickshell.
osExec("Y", "qs ipc call notifications dismissAll")
osExec("C", "qs ipc call volumeMixer toggle")

-- Discord.
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

-- Workspaces.
for i = 1, 9 do
    osDsp(tostring(i), hl.dsp.focus({ workspace = tostring(i), }))
    osDsp("SHIFT + " .. tostring(i), hl.dsp.window.move({ workspace = tostring(i), }))
end

osDsp("N", hl.dsp.focus({ workspace = "e-1", }))
osDsp("M", hl.dsp.focus({ workspace = "e+1", }))
osDsp("SHIFT + N", hl.dsp.window.move({ workspace = "e-1", }))
osDsp("SHIFT + M", hl.dsp.window.move({ workspace = "e+1", }))

-- Focus/open programs.
local function focus(program, class)
    local windows = hl.get_windows({ class = class, })

    if #windows == 0 then
        hl.exec_cmd(program)
        return
    end

    if #windows == 1 then
        hl.dispatch(hl.dsp.focus({ window = windows[1], }))

        return
    end

    local active = hl.get_active_window()
    for i, window in ipairs(windows) do
        if active and window.address == active.address then
            local next = windows[i % #windows + 1]

            hl.dispatch(hl.dsp.focus({ window = next, }))

            return
        else
            hl.dispatch(hl.dsp.focus({ window = windows[1], }))
        end
    end
end

local programShortcuts = {
    { "q", "nautilus", "org.gnome.Nautilus", },
    { "w", "firefox", },
    { "e", "discord", },
    { "r", "kitty", },
    { "t", "steam", },
}

for _, sh in ipairs(programShortcuts) do
    osExec("SHIFT + " .. sh[1], sh[2])
    osDsp(sh[1], function ()
        focus(sh[2], #sh == 3 and sh[3] or sh[2])
    end)
end
