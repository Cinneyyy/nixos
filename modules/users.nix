_:

{
    users.users."colin" = {
        isNormalUser = true;
        description = "colin";
        extraGroups = [
            "networkmanager"
            "wheel" # use sudo
            "scanner" # to use scanner
            "lp" # to use printer
        ];
    };

    home-manager = {
        useUserPackages = true;
        useGlobalPkgs = true;
        backupFileExtension = "backup";
    };
}
