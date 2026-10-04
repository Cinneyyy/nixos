{ ... }:

{
    programs.bash = {
        enable = true;
        shellAliases = {
            ll = "ls -lah";
            la = "ls -a";
            nrs = "sudo nixos-rebuild switch --flake ~/nixos";
            nv = "nvim .";
        };
        initExtra = ''
            export SUDO_EDITOR=nvim
        '';
    };
};
