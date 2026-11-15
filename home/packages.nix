{ pkgs, ... }:

{
    home.packages = with pkgs; [
        # CLI utils
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
        dig
        typst
        sl
        cowsay
        usbutils

        # Chat
        discord
        signal-desktop
        whatsapp-electron

        # GUI Utils
        kitty
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
        kdePackages.kolourpaint

        # Games
        prismlauncher
        dwarf-fortress
        mindustry
        supertuxkart
        benhsm-minesweeper

        # Dev
        gcc
        cmake
        (with dotnetCorePackages; combinePackages [
            sdk_8_0
            sdk_9_0
            sdk_10_0
            sdk_11_0
        ])
        python3
        zig
    ];
}
