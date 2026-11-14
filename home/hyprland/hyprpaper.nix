{ pkgs, ...}:

{
    home.packages = with pkgs; [
        hyprpaper
    ];

    services.hyprpaper = {
        enable = true;
        settings = {
            splash = false;
            wallpaper = {
                monitor = "";
                path = "~/.wallpapers/black.png";
                fit_mode = "cover";
            };
        };
    };
}
