{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
    ];

    home.file.".config/nvim" = {
        source = ./../dotfiles/nvim;
        recursive = true;
    };
}
