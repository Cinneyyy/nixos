{ pkgs, ... }:

{
    home.packages = with pkgs; [
        gcr
    ];

    services.gnome-keyring.enable = true;

    programs.git = {
        enable = true;
        package = pkgs.git.override {
            withLibsecret = true;
        };
        settings = {
            user = {
                email = "cinneyyy@proton.me";
                name = "Cinneyyy";
            };
            credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
            init.defaultBranch = "main";
            push.autoSetupRemote = true;
            pull.rebase = false;
        };
    };
}
