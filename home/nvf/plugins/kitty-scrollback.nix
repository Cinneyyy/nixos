{ pkgs, ... }:

{
    programs.nvf.settings.vim = {
        startPlugins = with pkgs.vimPlugins; [
            kitty-scrollback-nvim
        ];

        luaConfigRC.kitty-scrollback = ''
            require("kitty-scrollback").setup()
        '';
    };
}
