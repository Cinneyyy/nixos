{ pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        neovim
        vim
        kdePackages.dolphin
        firefox
        bat
        kitty
        proton-vpn-cli
        alsa-utils
        file
    ];

    programs.firefox.enable = true;

    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };

    # Cannot be installed via home.packages
    programs.steam.enable = true;
    programs.gamemode.enable = true;
}
