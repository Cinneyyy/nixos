{ pkgs, ... }:

{
    fonts.packages = with pkgs; [
        font-awesome_4   
        nerd-fonts.jetbrains-mono
    ];
}
