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
        ausweisapp
        eog

        # Games
        prismlauncher

        # Dev
        python3
        dotnetCorePackages.sdk_10_0
        gcc
        cmake
    ];
}
