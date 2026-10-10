{ ... }:

{
    programs.ssh = {
        enable = true;
        enableDefaultConfig = false;
        settings."pi" = {
            Hostname = "192.168.2.100";
            User = "cinneyyy";
            Port = 22;
            # IdentityFile = "~/.ssh/pi";
        };
    };
}
