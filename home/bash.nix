{ ... }:

{
    programs.bash = {
        enable = true;
        shellAliases = {
            ll = "ls -lah";
            la = "ls -a";

            nv = "nvim .";

            cat = "bat";
            cloc = "cloc .";

            gadd = "git add .";
            gcommit = "git commit -m";
            gpush = "git push -u";
        };
        initExtra = ''
            export SUDO_EDITOR=nvim
        '';
    };
}
