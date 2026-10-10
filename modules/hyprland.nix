{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        kitty
        hyprlauncher
        hyprpolkitagent
        hyprshutdown
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

    security.pam.services = {
        login.enableGnomeKeyring = true;
        greetd.enableGnomeKeyring = true;
        hyprlock = {};
    };

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
