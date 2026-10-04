{ config, pkgs, ... }:

{
    home.username = "colin";
    home.homeDirectory = "/home/colin";
    home.stateVersion = "26.05";

    programs.bash = {
        enable = true;
        shellAliases = {
            ll = "ls -la";
            la = "ls -a";
            nrs = "sudo nixos-rebuild switch --flake ~/nixos";
            nv = "nvim .";
        };
        initExtra = ''
            export SUDO_EDITOR=nvim
        '';
    };
}
