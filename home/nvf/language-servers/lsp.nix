_:

{
    programs.nvf.settings.vim.lsp = {
        enable = true;
        mappings = {
            renameSymbol = "<space>cr";
            codeAction = "<space>ca";
            goToDefinition = "<space>cd";
            goToDeclaration = "<space>cD";
            signatureHelp = "<space>cs";
            openDiagnosticFloat = "<space>co";
            nextDiagnostic = "<space>cn";
            previousDiagnostic = "<space>gp";
            listReferences = "<space>cR";
        };
    };
}
