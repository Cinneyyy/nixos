{ pkgs, ... }:
let
    suspendOnIdle = false;
in
{
    home.file.".config/hypr/hyprpaper.conf".source = ./dotfiles/.config/hypr/hyprpaper.conf;
    home.file.".config/hypr/hyprlock.conf".source = ./dotfiles/.config/hypr/hyprlock.conf;
    home.file.".config/hypr/wallpapers".source = ./dotfiles/.config/hypr/wallpapers;
    home.file.".config/hypr/hyprland".source = ./dotfiles/.config/hypr/hyprland;
}
