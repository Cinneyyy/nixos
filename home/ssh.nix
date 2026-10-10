{ ... }:

{
    programs.ssh = {
        enable = true;
        extraConfig = ''
            Host pi
                Hostname 192.168.2.100
                User cinneyyy
                Port 22
        '';
    };
}
