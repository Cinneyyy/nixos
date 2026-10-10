{ pkgs, inputs, ... }:
let
    suspendOnIdle = false;
in
{
    imports = [
        ./../../home
    ];

    home.packages = with pkgs; [
        brightnessctl
    ];

    programs.bash.shellAliases = {
        nrs = "sudo nixos-rebuild switch --flake ~/nixos#laptop";
    };

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
                before_sleep_cmd = "loginctl lock-session";
                after_sleep_cmd = "hyprctl dispatch 'hl.dsp.dpms({ action = \"enable\" })'";
            };
            listener = [
                {
                    timeout = 180;
                    on-timeout = "brightnessctl -s set 10";
                    on-resume = "brightnessctl -r";
                }
                {
                    timeout = 210;
                    on-timeout = "hyprctl dispatch 'hl.dsp.dpms({ action = \"disable\" })'";
                    on-resume = "hyprctl dispatch 'hl.dsp.dpms({ action = \"enable\" })'";
                }
                {
                    timeout = 300;
                    on-timeout = "systemctl suspend";
                }
            ];
        };
    };
}
