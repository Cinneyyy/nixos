{ pkgs, ... }:

{
    home.packages = with pkgs; [
        # CLI utils
        fastfetch
        zip
        unzip
        ffmpeg
        cloc
        diskus
        wev
        curl
        tree
        bat
        file
        alsa-utils
        keyd
        imagemagick

        # Chat
        discord
        signal-desktop
        whatsapp-electron

        # GUI Utils
        vlc
        bitwarden-desktop
        audacity
        dvdstyler
        gnome-system-monitor
        qbittorrent
        nautilus
        pcmanfm
        photoqt
        ausweisapp

        # Games
        prismlauncher

        # Dev
        python3
        dotnetCorePackages.sdk_10_0
        gcc
        cmake
    ];
}
