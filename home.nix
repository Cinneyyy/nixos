{ pkgs, ... }:

{
    home = {
        username = "colin";
        homeDirectory = "/home/colin";
        stateVersion = "26.05";
        packages = with pkgs; [
            fastfetch
            vlc
            discord
            bitwarden-desktop
            signal-desktop
            whatsapp-electron
            dotnet-sdk
            prismlauncher
            dvdstyler
            ffmpeg

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
}
