{ pkgs, ... }:

{
# {
#     "preset": [
#         "rainbow",
#         "transgender",
#         "nonbinary",
#         "bisexual"
#     ],
#     "mode": "rgb",
#     "auto_detect_light_dark": true,
#     "light_dark": "dark",
#     "lightness": 0.6,
#     "color_align": {
#         "mode": "horizontal"
#     },
#     "backend": "fastfetch",
#     "args": null,
#     "distro": null,
#     "pride_month_disable": false,
#     "custom_ascii_path": null,
#     "custom_presets": null,
#     "palette_glyph": null,
#     "palette_type": null
# }

    home.packages = with pkgs; [
        fastfetch
    ];

    programs = {
        hyfetch = {
            enable = true;
            settings = {
                preset = [
                    "rainbow"
                    "transgender"
                    "nonbinary"
                    "bisexual"
                ];
                mode = "rgb";
                color_align.mode = "horizontal";
                backend = "fastfetch";
                auto_detect_light_dark = false;
                light_dark = "dark";
                lightness = 0.55;
                args = null;
                distro = null;
                pride_month_disable = false;
                custom_ascii_path = null;
                custom_presets = null;
                palette_glyph = null;
                palette_type = null;
            };
        };

        bash.shellAliases = {
            ff = "fastfetch";
            hf = "hyfetch";
        };
    };
}
