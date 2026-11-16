_:

{
    users.users."colin" = {
        isNormalUser = true;
        description = "colin";
        extraGroups = [
            "wheel" # use sudo
            "networkmanager"
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
