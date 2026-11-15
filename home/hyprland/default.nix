{ pkgs, ... }:

{
    imports = [
        ./hyprlock.nix
        ./hyprpaper.nix
    ];

    home.packages = with pkgs; [
        hyprpolkitagent
        hyprshutdown
        libnotify
        quickshell
        grim
        grimblast
        slurp
        wl-clipboard
        playerctl
    ];

    home.file = {
        ".config/hypr/hyprland".source = ./../dotfiles/.config/hypr/hyprland;
        ".config/hypr/restore_hyprlock.sh".source = ./../dotfiles/.config/hypr/restore_hyprlock.sh;
    };
}
