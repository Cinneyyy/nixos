{ ... }:

{
    programs.bash = {
        enable = true;
        shellAliases = {
            ll = "ls -lah";
            la = "ls -a";

            commit = "git add . && git commit -m";
            push = "git push -u";

            nv = "nvim .";
            cloc = "cloc .";
            ff = "fastfetch";
        };
        initExtra = ''
            export SUDO_EDITOR=nvim
        '';
    };
}
