{ ... }:

{
    programs.kitty = {
        enable = true;
        settings = {
            scrollback_lines = 5000;
            tab_bar_edge = "top";
            tab_bar_style = "slant";
        };
        keybindings = {
            "ctrl+shift+l" = "next_tab";
            "ctrl+shift+h" = "previous_tab";
            "alt+1" = "goto_tab 1";
            "alt+2" = "goto_tab 2";
            "alt+3" = "goto_tab 3";
            "alt+4" = "goto_tab 4";
            "alt+5" = "goto_tab 5";
            "alt+6" = "goto_tab 6";
            "alt+7" = "goto_tab 7";
            "alt+8" = "goto_tab 8";
            "alt+9" = "goto_tab 9";
        };
        themeFile = "Cyberpunk-Neon";
    };
}
