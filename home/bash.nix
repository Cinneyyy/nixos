{ ... }:

{
    programs.bash = {
        enable = true;
        shellAliases = {
            ll = "ls -lah";
            la = "ls -a";

            nv = "nvim .";
            cloc = "cloc .";

            commit = "git add . && git commit -m";
            push = "git push -u";
        };
        initExtra = ''
            export SUDO_EDITOR=nvim
        '';
    };
}
