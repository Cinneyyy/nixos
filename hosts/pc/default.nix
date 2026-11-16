_:

{
    imports = [
        ./hardware-configuration.nix
        ./../../configuration.nix
        ./mic-fix.nix
    ];


    services.keyd.keyboards.default.settings.main = {
        # Volume controls
        kpslash = "volumedown"; # volume+
        kpasterisk = "volumeup"; # volume-
        kpminus = "mute"; # mute
        kpplus = "layer(meta)"; # microphone
        kp7 = "layer(shift)"; # 10x

        # Media controls
        kp1 = "play";
        kp2 = "previoussong";
        kp3 = "nextsong";
    };
}
