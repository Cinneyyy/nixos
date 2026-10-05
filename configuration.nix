{ config, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix

        ./modules/fileSystems.nix
        ./modules/locale.nix
        ./modules/pipewire.nix
        ./modules/users.nix # Also sets up home-manager.
        ./modules/hyprland.nix
        ./modules/systemPackages.nix
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
        wireless.enable = true,
        networkmanager.enable = true;
    };

    services.printing.enable = true;

    nix.settings.experimental-features = "nix-command flakes";

    # GC old generations
    # nix.gc = {
    #     automatic = true;
    #     dates = "weekly";
    #     options = "--delete-older-than 7d";
    # };
    nix.settings.auto-optimise-store = true;

    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 7d --keep 5";
    };

    # Don't change!!
    system.stateVersion = "26.05";
}
