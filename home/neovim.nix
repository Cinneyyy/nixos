 { pkgs, ... }:

 {
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        initLua = builtins.readFile ./dotfiles/.config/nvim/init.lua;
    };
 }
