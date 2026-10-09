{ pkgs, ... }:

{
    systemd.user.services.mic-fix = {
        description = "A script that changes some pipewire settings that fuck up my mic.";
        after = [ "pipewire.service" "wireplumber.service" ];
        wants = [ "pipewire.service" "wireplumber.service" ];
        wantedBy = [ "multi-user.target" ];
        script = ''
            pw-metadata -n settings 0 clock.force-quantum 1024
            pw-metadata -n settings 0 clock.force-rate 48000
        '';
    };

    systemd.services.alsa-mic-fix = {
        description = "A script that fixes another mic fuck up with ALSA.";
        wantedBy = [ "multi-user.target" ];
        after = [ "sound.target" ];
        wants = [ "sound.target" ];

        serviceConfig = {
            Type = "oneshot";
            RemainAfterExit = true;
        };

        script = ''
            ${pkgs.alsa-utils}/bin/amixer -c 1 sset 'Front Mic Boost' 0
        '';
    };

    systemd.user.services.pipewire-mic-fix = {
        description = "I hate PipeWire.";

        wantedBy = [ "default.target" ];
        after = [ "pipewire.service" "wireplumber.service" ];
        wants = [ "pipewire.service" "wireplumber.service" ];

        serviceConfig = {
            Type = "oneshot";
            RemainAfterExit = true;
        };

        script = ''
            ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 0.5
        '';
    };
}
