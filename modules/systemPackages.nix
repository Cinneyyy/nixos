_:

{
    nixpkgs.config.allowUnfree = true;

    programs = {
        vim.enable = true;

        firefox.enable = true;

        steam.enable = true;
        gamemode.enable = true;

        ausweisapp = {
            enable = true;
            openFirewall = true;
        };
    };
}
