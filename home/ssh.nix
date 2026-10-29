_:

{
    programs.ssh = {
        enable = true;
        enableDefaultConfig = false;
        settings."pi" = {
            Hostname = "pi.colin.monster";
            User = "pi";
            Port = 22;
            IdentitiesOnly = "yes";
        };
    };
}
