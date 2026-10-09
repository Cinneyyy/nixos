{ pkgs, ... }:

{
    services.pulseaudio.enable = false;

    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        extraConfig.pipewire."92-audio-settings" = {
            "context.properties" = {
                "default.clock.rate" = 48000;
                "default.clock.quantum" = 1024;
                "default.clock.min-quantum" = 1024;
                "default.clock.max-quantum" = 1024;
            };
        };
        jack.enable = false;
    };
}
