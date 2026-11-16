{ pkgs, ... }:

{
    programs.nvf.settings.vim = {
        startPlugins = with pkgs.vimPlugins; [
            rainbow-delimiters-nvim
        ];

        luaConfigRC.rainbow-delimiters = ''
            require("rainbow-delimiters.setup").setup {
                strategy = {
                    [""] = "rainbow-delimiters.strategy.global",
                    vim = "rainbow-delimiters.strategy.local",
                },
                query = {
                    [""] = "rainbow-delimiters",
                    lua = "rainbow-blocks",
                },
                priority = {
                    [""] = 110,
                    lua = 210,
                },
                highlight = {
                    "RainbowDelimiterYellow",
                    "RainbowDelimiterBlue",
                    "RainbowDelimiterOrange",
                    "RainbowDelimiterGreen",
                    "RainbowDelimiterViolet",
                    "RainbowDelimiterCyan",
                    "RainbowDelimiterRed",
                },
            }
        '';
    };
}
