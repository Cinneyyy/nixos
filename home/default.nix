{ pkgs, inputs, ... }:

{
    imports = [
        ./packages.nix
        ./theme.nix
        ./bash.nix
        ./git.nix
        ./ssh.nix
        ./hyprland.nix
    ];

    home = {
        username = "colin";
        homeDirectory = "/home/colin";
        stateVersion = "26.05"; # Don't change!!
    };

    home.file.".config/nvim".source = ./dotfiles/.config/nvim;
}
