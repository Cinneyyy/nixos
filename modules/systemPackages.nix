{ pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        neovim
        kdePackages.dolphin
        firefox
        bat
        kitty
    ];

    programs.firefox.enable = true;

    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };
}
