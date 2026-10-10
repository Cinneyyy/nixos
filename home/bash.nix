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
        };
        initExtra = ''
            export SUDO_EDITOR=nvim
        '';
    };
}
