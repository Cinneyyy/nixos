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

            statusline.section_fileinfo = function ()
                return colorScheme
            end

            statusline.section_lsp = function ()
                return ":3"
            end
        '';
    };
}
