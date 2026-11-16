_:

{
    imports = [
        ./opts.nix
        ./keymaps.nix
        ./color-scheme.nix
        ./autocmds.nix
        ./language-servers
        ./plugins
    ];

    programs.nvf = {
        enable = true;
        settings.vim = {
            viAlias = false;
            vimAlias = false;
        };
    };
}
