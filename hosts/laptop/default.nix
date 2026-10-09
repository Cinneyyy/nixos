{ ... }:

{
    imports = [
        ./hardware-configuration.nix
        ./../../configuration.nix
    ];

    services.keyd.keyboards.default.settings.main = {
<<<<<<< HEAD
        print = "102nd"; // PrtScn to "<"
=======
        sysrq = "102nd";
>>>>>>> 0ddc792aa4e2793a6e3124342120e3780be74b7c
    };
}
