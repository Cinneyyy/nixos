{ pkgs, ... }:

{
    hardware.sane = {
        enable = true;
        extraBackends = [
            pkgs.hplipWithPlugin
        ];
    };

    services.ipp-usb.enable = true;
}
