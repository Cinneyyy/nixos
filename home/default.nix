{ pkgs, inputs, ... }:

{
    imports = [
        ./packages.nix
        ./theme.nix

        ./bash.nix
        ./git.nix
        ./ssh.nix

        ./kitty.nix
        ./hyprland
        ./hyfetch.nix
        ./nvf

        ./cinny.nix

        ./protonvpn.nix
        ./qbittorrent.nix

        ./uni.nix
    ];

    home = {
        username = "colin";
        homeDirectory = "/home/colin";
        stateVersion = "26.05"; # Don't change!!
    };

    home.file.".wallpapers".source = ./dotfiles/.wallpapers;
}
