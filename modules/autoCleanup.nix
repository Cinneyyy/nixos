{ ... }:

{
    system.autoUpgrade = {
        enable = true;
        flake = "~/nixos";
        flags = [
            "--print-build-logs"
            "--commit-log-file"
        ];
        dates = "weekly";
    };

    systemd.services.nixos-upgrade.environment = {
        GIT_AUTHOR_NAME = "NixOS auto-upgrade";
        GIT_AUTHOR_EMAIL = "root@nix";
        GIT_COMMITER_NAME = "NixOS auto-upgrade";
        GIT_COMMITER_EMAIL = "root@nix";
    };

    nix.settings.auto-optimise-store = true;

    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 7d --keep 5";
    };
}
