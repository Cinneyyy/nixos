local hl = hl

hl.config({
    general = {
        gaps_in  = 3,
        gaps_out = 6,
        border_size = 2,
        resize_on_border = true,
        allow_tearing = true,
        layout = "dwindle",
    },
    decoration = {
        rounding = 5,
        rounding_power = 2.0,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
    },
    dwindle = {
        preserve_split = true,
    },
})

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
