local hl = hl

require("hyprland/autostart")
require("hyprland/window_style")
require("hyprland/animations")
require("hyprland/input")
require("hyprland/shortcuts")
require("hyprland/workspaces")
require("hyprland/window_rules")

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1,
})


hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
})
