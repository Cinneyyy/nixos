{ pkgs, ... }:
let
    gitPkg = pkgs.git.override {
        withLibsecret = true;
    };
in
{
    home.packages = with pkgs; [
        gcr
    ];

    services.gnome-keyring.enable = true;

    programs.git = {
        enable = true;
        package = gitPkg;
        settings = {
            user = {
                email = "cinneyyy@proton.me";
                name = "Cinneyyy";
            };
            credential.helper = "${gitPkg}/bin/git-credential-libsecret";
            init.defaultBranch = "main";
            push.autoSetupRemote = true;
            pull.rebase = false;
        };
    };
}
