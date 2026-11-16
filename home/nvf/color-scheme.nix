_:

{
    # Random color scheme.
    programs.nvf.settings.vim = {
        luaConfigRC.colorScheme = ''
            local colorSchemes = {
                "pablo",
                "retrobox",
                "retrobox", -- twice, for good measure
                "sorbet",
                "lunaperche",
                "elflord",
                "zaibatsu",
                "wildcharm",
                "catppuccin",
                "darkblue",
                "slate",
                "koehler",
                --"murphy",
                --"ron",
            };

            colorScheme = ""
            function selColorScheme()
                math.randomseed(os.time())
                colorScheme = colorSchemes[math.random(#colorSchemes)]
                vim.cmd.colorscheme(colorScheme)
            end

            vim.api.nvim_create_user_command("PickColorScheme", function(opts)
                selColorScheme()
            end, { nargs = 0 })

            selColorScheme()
        '';

        keymaps = [
            { mode = "n"; key = "<space>tc"; action = ":PickColorScheme<cr>"; }
        ];
    };
}
