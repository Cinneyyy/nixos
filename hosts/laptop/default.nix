{ ... }:
{
    imports = [
        ./hardware-configuration.nix
        ./../../configuration.nix
        ./tlp.nix
    ];

    services.keyd.keyboards.default.settings.main = {
        sysrq = "102nd";
    };
}
