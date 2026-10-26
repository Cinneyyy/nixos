{ pkgs, ... }:

{
    programs.kitty = {
        enable = true;
        settings = {
            scrollback_lines = 10000;
            tab_bar_edge = "top";
            tab_bar_style = "slant";
            allow_remote_control = "socket-only";
            listen_on = "unix:/tmp/kitty";
        };
        keybindings = {
            "ctrl+shift+l" = "next_tab";
            "ctrl+shift+h" = "previous_tab";
            "ctrl+shift+f" = "kitty_scrollback_nvim";
            "alt+1" = "goto_tab 1";
            "alt+2" = "goto_tab 2";
            "alt+3" = "goto_tab 3";
            "alt+4" = "goto_tab 4";
            "alt+5" = "goto_tab 5";
            "alt+6" = "goto_tab 6";
            "alt+7" = "goto_tab 7";
            "alt+8" = "goto_tab 8";
            "alt+9" = "goto_tab 9";
            "ctrl+1" = "goto_tab 1";
            "ctrl+2" = "goto_tab 2";
            "ctrl+3" = "goto_tab 3";
            "ctrl+4" = "goto_tab 4";
            "ctrl+5" = "goto_tab 5";
            "ctrl+6" = "goto_tab 6";
            "ctrl+7" = "goto_tab 7";
            "ctrl+8" = "goto_tab 8";
            "ctrl+9" = "goto_tab 9";
        };
        themeFile = "Cyberpunk-Neon";
        extraConfig = ''
            action_alias kitty_scrollback_nvim kitten ${
                pkgs.vimPlugins.kitty-scrollback-nvim
            }/python/kitty_scrollback_nvim.py
        '';
    };
}
