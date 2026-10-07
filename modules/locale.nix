{ ... }:

{
    time.timeZone = "Europe/Berlin";

    i18n.defaultLocale = "en_GB.UTF-8";
    i18n.extraLocaleSettings = {
        LC_ADDRESS = "de_DE.UTF-8";
        LC_IDENTIFICATION = "de_DE.UTF-8";
        LC_MEASUREMENT = "de_DE.UTF-8";
        LC_MONETARY = "de_DE.UTF-8";
        LC_NAME = "de_DE.UTF-8";
        LC_NUMERIC = "en_GB.UTF-8";
        LC_PAPER = "de_DE.UTF-8";
        LC_TELEPHONE = "de_DE.UTF-8";
        LC_TIME = "de_DE.UTF-8";
    };

    console.keyMap = "de";

    services.keyd = {
        enable = true;
        keyboards.default = {
            ids = [
                "*"
            ];
            settings.main = {
                # z = "y";
                # y = "z";
                capslock = "esc";
                kpslash = "volumedown";
                kpasterisk = "volumeup";
                kpminus = "mute";
            };
        };
    };
}
