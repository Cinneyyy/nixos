{ pkgs, ... }:

{
    home = {
        username = "colin";
        homeDirectory = "/home/colin";
        stateVersion = "26.05";
        # packages = with pkgs; [ 
        #     pkgs.writeShellApplication {
        #         name = "ns";
        #         runtimeInputs = with pkgs; [
        #             fzf
        #             nix-search-tv
        #         ];
        #         text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
        #     }
        # ];
    };

    imports = [
        ./modules/programs/bash.nix        
        ./modules/programs/nvim.nix
        ./modules/programs/git.nix
        ./modules/wm/hyprland.nix
    ];


}
