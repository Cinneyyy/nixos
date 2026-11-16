{ pkgs, ... }:

{
    programs.nvf = {
        settings.vim = {
            startPlugins = with pkgs.vimPlugins; [
                indent-blankline-nvim
            ];

            luaConfigRC.indent-blankline = ''
                require("ibl").setup()
            '';
        };
    };
}
