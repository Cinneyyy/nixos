_:

{
    programs.nvf.settings.vim = {
        # TODO: mini.stautsline.setupOpts?

        mini.statusline.enable = true;

        luaConfigRC.mini-statusline = ''
            statusline = require "mini.statusline"

            statusline.section_location = function ()
                return "%3l:%-2v %-3L"
            end

            statusline.section_fileinfo = function (args)
                return colorScheme .. " :3"
            end
        '';
    };
}
