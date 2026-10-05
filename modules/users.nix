{ ... }:

{
    users.users."colin" = {
        isNormalUser = true;
        description = "colin";
        extraGroups = [ "networkmanager" "wheel" ];
    };

    home-manager = {
        useUserPackages = true;
        useGlobalPkgs = true;
        backupFileExtension = "backup";
        users.colin = import ./../home.nix;
    };
}
