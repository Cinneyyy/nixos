{ pkgs, inputs, ... }:

{
    imports = [
        ./../../home.nix
    ];

    home.packages = with pkgs; [
    ];

    programs.bash.shellAliases = {
        nrs = "sudo nixos-rebuild switch --flake ~/nixos#pc";
    };
}
