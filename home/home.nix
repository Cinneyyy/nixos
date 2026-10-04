{ config, pkgs, ... }:

{
    home.username = "colin";
    home.homeDirectory = "/home/colin";
    home.stateVersion = "26.05";

    imports = [
        ./programs/bash.nix        
        ./programs/nvim.nix
    ];
}
