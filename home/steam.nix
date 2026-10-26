{ ... }:

{
    programs.steam.config = {
        enable = true;
        desktopEntries.enable = false;
        displayRatesAsBits = false;
        onSteamRunning = "close";
    };
}
