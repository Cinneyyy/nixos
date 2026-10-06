{ pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        neovim
        kdePackages.dolphin
        firefox
        bat
        kitty
        proton-vpn-cli
        alsa-utils
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
