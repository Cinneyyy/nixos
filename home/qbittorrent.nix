{ pkgs, ... }:

{
    home.packages = with pkgs; [
        qbittorrent
    ];

    home.file.".config/qBittorrent/qBittorrent.conf" = {
        force = true;
        source = ./dotfiles/.config/qBittorrent/qBittorrent.conf;
    };
}
