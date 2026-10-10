 { pkgs, ... }:

 {
    # home.packages = with pkgs; [
    #     clang-tools
    #     lemminx
    #     vscode-langservers-extracted
    #     vtsls
    #     lua-language-server
    #     roslyn-ls
    # ];

    programs.neovim = {
        enable = true;
        defaultEditor = true;
        initLua = builtins.readFile ./dotfiles/.config/nvim/init.lua;
        plugins = with pkgs.vimPlugins; [
            telescope-nvim
            # mason-nvim
            # mason-lspconfig-nvim
            # blink-cmp
            # nvim-lspconfig
            # nvim-treesitter
        ];
    };
 }
