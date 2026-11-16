_:

{
    programs.nvf.settings.vim.autocomplete = {
        blink-cmp = {
            enable = true;
            setupOpts = {
                keymap = {
                    preset = "none";
                    "<c-space>" = ["show" "show_documentation" "fallback"];
                    "<c-n>" = ["select_next" "fallback"];
                    "<c-p>" = ["select_prev" "fallback"];
                    "<c-c>" = ["hide" "fallback"];
                    "<c-o>" = ["accept" "fallback"];
                    "<c-s>" = ["show_signature" "hide_signature" "fallback"];
                };
                appearance.nerd_font_variant = "mono";
                fuzzy.implementation = "lua";
                signature.enabled = true;
                completion = {
                    documentation.auto_show = true;
                    menu.auto_show = true;
                };
            };
        };
    };
}
