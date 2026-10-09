{ ... }:

{
    imports = [
        ./hardware-configuration.nix
        ./../../configuration.nix
    ];

    services.keyd.keyboards.default.settings.main = {
        sysrq = "102nd";
    };
}
