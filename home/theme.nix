{ pkgs, ... }:

{
    home.pointerCursor = {
        gtk.enable = true;
        package = pkgs.adwaita-icon-theme;
        name = "Adwaita";
        size = 16;
    };

    gtk = {
        enable = true;
        theme = {
            package = pkgs.flat-remix-gtk;
            name = "Flat-Remix-GTK-Violet-Dark";
        };
        colorScheme = "dark";
        iconTheme = {
            package = pkgs.adwaita-icon-theme;
            name = "Adwaita";
        };
    };

    dconf = {
        enable = true;
        settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
    };

    # qt = {
    #     enable = true;
    #     platformTheme.name = "qtct";
    #     style.name = "kvantum";
    # };
}
