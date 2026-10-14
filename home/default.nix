{ pkgs, inputs, ... }:

{
    imports = [
        ./packages.nix
        ./theme.nix

        ./bash.nix
        ./git.nix
        ./ssh.nix

        ./kitty.nix
        ./hyprland.nix
        ./nvf.nix
        # ./neovim.nix

        ./protonvpn.nix
        ./qbittorrent.nix
    ];

    home = {
        username = "colin";
        homeDirectory = "/home/colin";
        stateVersion = "26.05"; # Don't change!!
    };

    home.file.".wallpapers".source = ./dotfiles/.wallpapers;
}
