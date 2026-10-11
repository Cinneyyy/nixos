{ pkgs, ... }:

{
    home.packages = with pkgs; [
        qbittorrent
    ];

    home.file.".config/qBittorrent/qBittorrent.conf".source = ./dotfiles/.config/qBittorrent/qBittorrent.conf;
}
