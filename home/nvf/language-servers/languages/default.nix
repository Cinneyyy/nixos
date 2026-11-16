_:

{
    imports = [
        ./csharp.nix
    ];

    programs.nvf.settings.vim.languages = {
        enableTreesitter = true;
        enableFormat = false;
        cmake.enable = true;
        json.enable = true;
        css.enable = true;
        qml.enable = false;
        typst.enable = true;

        nix = {
            enable = true;
            extraDiagnostics.enable = true;
            lsp.enable = true;
        };

        clang = {
            enable = true;
            cHeader = true;
            extraDiagnostics.enable = true;
        };

        bash = {
            enable = true;
            extraDiagnostics.enable = true;
        };

        html = {
            enable = true;
            extraDiagnostics.enable = true;
            treesitter.autotagHtml = true;
        };

        typescript = {
            enable = true;
            extraDiagnostics.enable = true;
        };

        lua = {
            enable = true;
            extraDiagnostics.enable = true;
        };

        markdown = {
            enable = true;
            extensions.markview-nvim = {
                enable = true;
                setupOpts.preview.enable = false;
            };
        };

        zig = {
            enable = true;
            dap.enable = true;
        };

        java = {
            enable = true;
            dap.enable = true;
        };
    };
}
