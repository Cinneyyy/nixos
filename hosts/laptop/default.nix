_:

{
    imports = [
        ./hardware-configuration.nix
        ./../../configuration.nix
        ./tlp.nix
    ];

    services.keyd.keyboards.default.settings.main = {
        sysrq = "102nd";
    };

    services.logind.settings.Login = {
        HandleLidSwitch = "suspend";
        HandleLidSwitchExternalPower = "suspend";
    };

    # TODO: test which works better.
    # services.logind.settings.Login = {
    #     HandleLidSwitch = "hibernate";
    #     HandleLidSwitchExternalPower = "suspend";
    # };
    #
    # security.protectKernelImage = false;
}
