{ pkgs, ... }:

{
    programs.nvf.settings.vim.extraPlugins.indent-blankline = {
        package = pkgs.vimPlugins.indent-blankline-nvim;
        setup = ''
            require("ibl").setup()
        '';
    };
}
