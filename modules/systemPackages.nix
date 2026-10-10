{ pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        vim
        kitty
        firefox
    ];

    programs.firefox.enable = true;

    # Cannot be installed via home.packages
    programs.steam.enable = true;
    programs.gamemode.enable = true;
}
