{ config, pkgs, ... }:

{
    home.file.".config/hypr".source = ../../home/dotfiles/hypr;

    # wayland.windowManager.hyprland = {
    #     enable = true;
    #     package = null;
    #     portalPackage = null;
    # };
    #
    # home.pointerCursor = {
    #     gtk.enable = true;
    #     package = pkgs.adwaita-icon-theme;
    #     name = "Adwaita";
    #     size = 16;
    # };
    #
    # gtk = {
    #     enable = true;
    #
    #     theme = {
    #         package = pkgs.flat-remix-gtk;
    #         name = "Flat-Remix-GTK-Violet-Dark";
    #     };
    #
    #     iconTheme = {
    #         package = pkgs.adwaita-icon-theme;
    #         name = "Adwaita";
    #     };
    #
    #     # font = {
    #     #     name = "Sans";
    #     #     size = "11";
    #     # };
    # };
}
