{ pkgs, inputs, ... }:

{
    imports = [
        ./../../home
    ];

    home.packages = with pkgs; [
    ];

    programs.bash.shellAliases = {
        nrs = "sudo nixos-rebuild switch --flake ~/nixos#pc";
    };

    programs.ssh.settings."pi".IdentityFile = "~/.ssh/pc-to-pi";

    home.file.".config/hypr/hyprland.lua".source = ./dotfiles/.config/hypr/hyprland.lua;

    services.hypridle = {
        enable = true;
        package = pkgs.hypridle;
        settings = {
            general = {
                ignore_dbus_inhibit = false;
                ignore_systemd_inhibit = false;
                ignore_wayland_inhibit = false;
                lock_cmd = "pidof hyprlock || hyprlock";
            };
            listener = [
                {
                    timeout = 600;
                    on-timeout = "loginctl lock-session";
                }
            ];
        };
    };
}
