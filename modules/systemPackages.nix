{ pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        neovim
        vim
        kitty
        firefox
        proton-vpn-cli
        steam
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
