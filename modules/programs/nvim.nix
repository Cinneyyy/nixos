{ config, pkgs, ... }:

{
    # home.file.".config/nvim" = {
    #     source = ./../../home/dotfiles/nvim;
    #     recursive = true;
    # };



}

/*
# nvim.nix
{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      telescope-nvim
      nvim-treesitter
    ];

    extraConfig = ''
      set number
      set relativenumber
    '';
  };
}
*/
