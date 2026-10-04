{ config, pkgs, ... }:

{
    home.packages = [
        neovim
    ];

    home.file.".config/nvim" = {
        source = ./../dotfiles/nvim;
        recursive = true;
    };
}
