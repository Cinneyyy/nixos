_:

{
    programs.ssh = {
        enable = true;
        enableDefaultConfig = false;
        settings = {
            PasswordAuthentication = false;
            KbdInteractiveAuthentication = false;
            PermitRootLogin = "no";
            AllowUsers = [];
            "pi.colin.monster" = {
                Hostname = "pi.colin.monster";
                User = "pi";
                Port = 42069;
                IdentitiesOnly = "yes";
            };
            "pi" = {
                Hostname = "192.168.2.100";
                User = "pi";
                Port = 22;
                IdentitiesOnly = "yes";
            };
        };
    };
}
