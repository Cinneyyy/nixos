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
        ./nvf.nix
        ./hyfetch.nix

        ./cinny.nix
        # ./prismix.nix

        ./protonvpn.nix
        ./qbittorrent.nix

        ./uni.nix
        #./steam.nix # enable once there are more options to set.
    ];

    home = {
        username = "colin";
        homeDirectory = "/home/colin";
        stateVersion = "26.05"; # Don't change!!
    };

    home.file.".wallpapers".source = ./dotfiles/.wallpapers;
}
