{ lib, ... }:

{
    programs.nvf.settings.vim = {
        languages.csharp = {
            enable = true;
            lsp.servers = [
                "roslyn-ls"
            ];
            extensions = {
                roslyn-nvim = {
                    enable = true;
                    setupOpts = {
                        broad_search = true;
                        filewatching = "roslyn";
                        background_analysis = {
                            dotnet_analyzer_diagnostics_scope = "fullSolution";
                            dotnet_compiler_diagnostics_scope = "fullSolution";
                        };
                        code_lens.dotnet_enable_references_code_lens = true;
                        completion = {
                            dotnet_provide_regex_completions = true;
                            dotnet_show_completion_items_from_unimported_namespaces = true;
                            dotnet_show_name_completion_suggestions = true;
                        };
                    };
                };
            };
        };

        luaConfigRC.roslyn-disable-daemon-mode = ''
            vim.lsp.config("roslyn", {
                cmd = {
                    "Microsoft.CodeAnalysis.LanguageServer",
                    "--stdio",
                    "--autoLoadProjects",
                },
            })
        '';

        autocmds = [
            # Disable treesitter indentation for C#.
            {
                event = [
                    "FileType"
                ];
                pattern = [
                    "cs"
                    "csx"
                ];
                callback = lib.mkLuaInline ''
                    function ()
                        vim.bo.indentexpr = ""
                        vim.bo.autoindent = true
                    end
                '';
            }
        ];
    };
}
