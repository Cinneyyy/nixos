{ ... }:

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

    systemd.user.services.mic-fix = {
        description = "A script that changes some pipewire settings that fuck up my mic.";
        serviceConfig.PassEnvironment = "DISPLAY";
        script = ''
            pw-metadata -n settings 0 clock.force-quantum 1024
            pw-metadata -n settings 0 clock.force-rate 48000
        '';
        wantedBy = [ "multi-user.target" ]; # Starts after login.
    };
}
