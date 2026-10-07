{ pkgs, inputs, ... }:

{
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

            # Games
            prismlauncher

            # Dev
            # dotnetCorePackages.sdk_8_0
            # dotnetCorePackages.sdk_9_0
            dotnetCorePackages.sdk_10_0

            # # ns; doesnt work for some reason (i am no good at the nix language)
            # pkgs.writeShellApplication {
            #     name = "ns";
            #     runtimeInputs = with pkgs; [
            #         fzf
            #         nix-search-tv
            #     ];
            #     text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
            # }
        ];
    };

    ### Modularize these later

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

        iconTheme = {
            package = pkgs.adwaita-icon-theme;
            name = "Adwaita";
        };

        # font = {
        #     name = "Sans";
        #     size = "11";
        # };
    };

    programs.bash = {
        enable = true;
        shellAliases = {
            ll = "ls -lah";
            la = "ls -a";
            nrs = "sudo nixos-rebuild switch --flake ~/nixos";
            nv = "nvim .";
        };
        initExtra = ''
            export SUDO_EDITOR=nvim
        '';
    };

    programs.git = {
        enable = true;
        settings = {
            user = {
                email = "cinneyyy@proton.me";
                name = "Cinneyyy";
            };
            init.defaultBranch = "main";
        };
    };


    home.file.".config/hypr".source = ./dotfiles/hypr;
    home.file.".config/nvim".source = ./dotfiles/nvim;
    home.file.".ssh/config".source = ./dotfiles/.ssh/config;

    # programs.nix-ld.enable = true;
}
