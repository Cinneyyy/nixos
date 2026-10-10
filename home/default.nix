{ pkgs, inputs, ... }:

{
    imports = [
        ./hyprland.nix
    ];

    home = {
        username = "colin";
        homeDirectory = "/home/colin";
        stateVersion = "26.05";
        packages = with pkgs; [
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
            gcr
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
    };

    # TODO: Modularize these

    home.pointerCursor = {
        gtk.enable = true;
        package = pkgs.adwaita-icon-theme;
        name = "Adwaita";
        size = 16;
    };

    gtk = {
        enable = true;

        theme = {
            package = pkgs.flat-remix-gtk;
            name = "Flat-Remix-GTK-Violet-Dark";
        };

        colorScheme = "dark";
        theme = {
            
        };

        iconTheme = {
            package = pkgs.adwaita-icon-theme;
            name = "Adwaita";
        };
    };

    dconf = {
        enable = true;
        settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
    };

    # qt = {
    #     enable = true;
    #     platformTheme.name = "qtct";
    #     style.name = "kvantum";
    # };

    programs.bash = {
        enable = true;
        shellAliases = {
            ll = "ls -lah";
            la = "ls -a";
            nv = "nvim .";
            cat = "bat";
            clocl = "cloc .";
        };
        initExtra = ''
            export SUDO_EDITOR=nvim
        '';
    };

    services.gnome-keyring.enable = true;

    programs.git = {
        enable = true;
        package = pkgs.git.override {
            withLibsecret = true;
        };
        settings = {
            user = {
                email = "cinneyyy@proton.me";
                name = "Cinneyyy";
            };
            credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
            init.defaultBranch = "main";
            push.autoSetupRemote = true;
            pull.rebase = false;
        };
    };

    home.file.".config/nvim".source = ./dotfiles/.config/nvim;
    home.file.".ssh/config".source = ./dotfiles/.ssh/config;
}
