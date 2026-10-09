{ ... }:

{
    imports = [
        ./hardware-configuration.nix
        ./../../configuration.nix
    ];

    services.keyd.keyboards.default.settings.main = {
        print = "102nd"; // PrtScn to "<"
    };
}
