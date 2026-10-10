{ pkgs, inputs, ... }:

{
    imports = [
        ./packages.nix
        ./theme.nix
        ./bash.nix
        ./git.nix
        ./ssh.nix
        ./hyprland.nix
        ./neovim.nix
        ./kitty.nix
    ];

    home = {
        username = "colin";
        homeDirectory = "/home/colin";
        stateVersion = "26.05"; # Don't change!!
    };

    home.file.".wallpapers".source = ./dotfiles/.wallpapers;
}
