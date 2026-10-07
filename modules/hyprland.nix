{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        kitty
        hyprpaper
        hyprlauncher
        hyprpolkitagent
        libnotify
        quickshell
        grim
        slurp
        wl-clipboard
    ];

    programs.hyprland = {
        enable = true;
        withUWSM = true;
    };

    # Hint Electron apps to use Wayland.
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    services.greetd = {
        enable = true;
        settings = {
            default_session = {
                command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd 'uwsm start hyprland-uwsm.desktop'";
                user = "greeter";
            };
        };
    };
}
