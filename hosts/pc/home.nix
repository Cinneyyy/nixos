{ pkgs, inputs, ... }:

{
    imports = [
        ./../../home.nix
    ];

    home.packages = with pkgs; [
    ];

    programs.bash.shellAliases = {
        nrs = "sudo nixos-rebuild switch --flake ~/nixos#pc";
    };

    home.file.".config/hypr/hyprland.lua".source = ./dotfiles/.config/hypr/hyprland.lua;
}
