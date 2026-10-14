{ pkgs, ... }:

{
    home.packages = with pkgs; [
        ripgrep
        # clang-tools
        # lemminx
        # vscode-langservers-extracted
        # vtsls
        # lua-language-server
        # roslyn-ls
    ];

    programs.neovim = {
        enable = true;
        defaultEditor = true;
        initLua = builtins.readFile ./dotfiles/.config/nvim/init.lua;
        plugins = with pkgs.vimPlugins; [
            telescope-nvim
            indent-blankline-nvim
            rainbow-delimiters-nvim
            # mason-nvim
            # mason-lspconfig-nvim
            # blink-cmp
            # nvim-lspconfig
            # nvim-treesitter
        ];
    };

    home.file.".config/nvim/lua".source = ./dotfiles/.config/nvim/lua;
}
