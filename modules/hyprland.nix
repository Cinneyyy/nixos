{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        kitty
        hyprpaper
        hyprlauncher
        hyprpolkitagent
        hyprlock
        libnotify
        quickshell
        grim
        slurp
        wl-clipboard
        playerctl
    ];

    programs.hyprland = {
        enable = true;
        withUWSM = true;
    };

    # Hint Electron apps to use Wayland.
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    security.pam.services.login.enableGnomeKeyring = true;
    security.pam.services.greetd.enableGnomeKeyring = true;

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
