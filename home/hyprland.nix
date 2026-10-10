{ pkgs, ... }:
let
    suspendOnIdle = false;
in
{
    home.file.".config/hypr/wallpapers".source = ./dotfiles/.config/hypr/wallpapers;
    home.file.".config/hypr/hyprland".source = ./dotfiles/.config/hypr/hyprland;

    programs.hyprlock = {
        enable = true;
        package = pkgs.hyprpaper;
        settings = {
            general.hide_cursor = true;
            background = {
                monitor = "";
                path = "screenshot";
                blur_passes = 3;
            };
            input-field = {
                monitor = "";
                size = "20%, 5%";
                outline_thickness = 4;
                fade_on_empty = false;
                rounding = 15;

                inner_color = "rgb(202020)";
                outer_color = "rgb(505050)";
                check_color = "rgb(00ff99)";
                fail_color = "rgb(ff6633)";
                font_color = "rgb(aaaaaa)";

                font_family = "JetBrainsMono Nerd Font";
                placeholder_text = "Password please :3";
                fail_text = "$PAMFAIL$FPRINTFAIL";

                dots_text_format = "*";

                halign = "center";
                valign = "center";
            };
        };
    };

    services.hyprpaper = {
        enable = true;
        package = pkgs.hyprpaper;
        settings = {
            splash = false;
            wallpaper = {
                monitor = "";
                path = "~/.config/hypr/wallpapers/gnome-violet.webp";
                fit_mode = "cover";
            };
        };
    };
}
