_:

{
    programs.nvf.settings.vim = {
        mini.statusline.enable = true;
        luaConfigRC.mini-statusline = ''
            require("mini.statusline").setup({
                content = {
                    active = function ()
                        local mode = MiniStatusline.section_mode({ trunc_width = 120, })
                        local filename = MiniStatusline.section_filename({ trunc_width = 140, })

                        return MiniStatusline.combine_groups({
                            {
                                hl = mode,
                                strings = {
                                    mode,
                                },
                            },
                            {
                                hl = "MiniStatuslineDevinfo",
                                strings = {
                                    ":3",
                                }
                            },
                            "%<", -- trunc point
                            {
                                hl = "MiniStatuslineFilename",
                                strings = {
                                    filename,
                                },
                            },
                            "%=", -- end left align
                            {
                                hl = "MiniStatuslineFileinfo",
                                strings = {
                                    colorScheme,
                                },
                            },
                            {
                                hl = mode,
                                strings = {
                                    "%3l:%-2v %-3L",
                                },
                            },
                        })
                    end,
                },
            })
        '';
    };
}
