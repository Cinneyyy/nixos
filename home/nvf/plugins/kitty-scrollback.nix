{ pkgs, ... }:

{
    programs.nvf.settings.vim.extraPlugins.kitty-scrollback = {
        package = pkgs.vimPlugins.kitty-scrollback-nvim;
        setup = ''
            require("kitty-scrollback").setup()
        '';
    };
}
