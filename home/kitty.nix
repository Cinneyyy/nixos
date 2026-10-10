{ ... }:

{
    programs.kitty = {
        enable = true;
        settings = {
            scrollback_lines = 5000;
            tab_bar_edge = "top";
            tab_bar_style = "slant";
        };
        themeFile = "Cyberpunk-Neon";
    };
}
