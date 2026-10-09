{ pkgs, inputs, ... }:

{
    imports = [
        ./../../home.nix
    ];

    home.packages = with pkgs; [
        brightnessctl
    ];

    programs.bash.shellAliases = {
        nrs = "sudo nixos-rebuild switch --flake ~/nixos#laptop";
    };
}
