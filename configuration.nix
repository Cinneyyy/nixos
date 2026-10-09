{ config, pkgs, ... }:

{
    imports = [
        ./modules/fileSystems.nix
        ./modules/locale.nix
        ./modules/pipewire.nix
        ./modules/users.nix # Also sets up home-manager.
        ./modules/hyprland.nix
        ./modules/systemPackages.nix
        ./modules/autoCleanup.nix # Manages automatic system upgrades and garbage collection.
        ./modules/fonts.nix
    ];

    boot = {
        loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
        };
        extraModprobeConfig = "options snd_hda_intel power_save=0";
    };

    networking = {
        hostName = "nix";
        wireless.enable = true;
        networkmanager.enable = true;
    };

    services.printing.enable = true;

    nix.settings.experimental-features = "nix-command flakes";

    # Don't change!!
    system.stateVersion = "26.05";
}
