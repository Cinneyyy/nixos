# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.extraModprobeConfig = ''
    options snd_hda_intel power_save=0
  '';

  networking.hostName = "nix"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

# UUID=a651ae56-a816-428c-84b7-a3220d923e10 /media/colin/4T-SSD ext4 defaults 0 0
# UUID=b55a5493-6da9-4abe-823e-3aff9aeb7b1e /media/colin/4T-HDD ext4 defaults 0 0
  fileSystems."/home/colin/mnt/4T-SSD" = {
    device = "/dev/disk/by-uuid/a651ae56-a816-428c-84b7-a3220d923e10";
    fsType = "ext4";
    options = [
      "users"
      "nofail"
      "exec"
      "x-gvfs-show"
      "noatime"
    ];
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  # services.xserver.enable = false;

  # Enable the KDE Plasma Desktop Environment
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  # services.xserver.xkb = {
  #   layout = "de";
  #   variant = "qwerty";
  # };

  # Configure console keymap
  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Sound with pulseaudio
  services.pulseaudio.enable = false;

  # Enable pipewire without audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    extraConfig.pipewire."92-audio-settings" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
	"default.clock.quantum" = 1024;
	"default.clock.min-quantum" = 1024;
	"default.clock.max-quantum" = 1024;
      };
    };
    # If you want to use JACK applications, uncomment this
    # jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."colin" = {
    isNormalUser = true;
    description = "colin";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    users.colin = ./home.nix;
  };

  # TODO: automatic updates
  # TODO: flakes
  # TODO: nvim/hyprland home-manager config

  # GC old generations
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  nix.settings.auto-optimise-store = true;

  programs.firefox.enable = true;
  programs.steam.enable = true;

  # programs.nh = {
  #   enable = true;
  #   clean.enable = true;
  #   clean.extraArgs = "--keep-since 7d --keep 3";
  # };

  programs.hyprland.enable = true;
  # xdg.portal = {
  #   enable = true;
  #   extraPortals = [
  #     xdg-desktop-portal-gtk
  #   ];
  # };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
     firefox
     neovim
     fastfetch
     vlc
     discord
     steam
     bitwarden-desktop
     signal-desktop
     whatsapp-electron
     dotnet-sdk
     prismlauncher
     git
     dvdstyler
     ffmpeg
     bat

     # hyprland
     hyprland
     kitty
     hyprpaper
     waybar
     mako 
     libnotify
     rofi
     hyprlauncher
  ];

  nix.settings.experimental-features = "nix-command flakes";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?
}
