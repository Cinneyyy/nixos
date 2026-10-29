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
        zoxide
        fzf
        trash-cli
        obs-studio
        #pay-respects
        superfile
        wget
        dig

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
        nautilus
        pcmanfm
        eog
        libreoffice
        drawy
        localsend
        thunderbird
        rpi-imager
        fluffychat

        # Games
        prismlauncher
        dwarf-fortress
        mindustry
        supertuxkart

        # Dev
        python3
        dotnetCorePackages.sdk_10_0
        gcc
        cmake
        zig
    ];
}
