{ pkgs, ... }:

{
    home.packages = with pkgs; [
        proton-vpn-cli
    ];

    home.file.".config/Proton/VPN/settings.json".source = ./dotfiles/.config/Proton/VPN/settings.json;
}
