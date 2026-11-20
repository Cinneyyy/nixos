_:

{
    nix.settings.auto-optimise-store = true;

    programs.nh = {
        enable = true;
        clean.enable = true;
        clean.extraArgs = "--keep-since 7d --keep 5";
    };
}
