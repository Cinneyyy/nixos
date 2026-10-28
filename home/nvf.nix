{ pkgs, lib, ... }:

{
    programs.nvf = {
        enable = true;
        settings.vim = {
            viAlias = false;
            vimAlias = false;
            keymaps = [
                # Move lines(s) up/down with CTRL+j/k.
                { mode = "n"; key = "<c-j>"; action = ":m .+1<cr>=="; }
                { mode = "n"; key = "<c-k>"; action = ":m .-2<cr>=="; }
                { mode = "v"; key = "<c-j>"; action = ":m '>+1<cr>gv=gv"; }
                { mode = "v"; key = "<c-k>"; action = ":m '<-2<cr>gv=gv"; }

                # Open and navigate terminal.
                { mode = "n"; key = "<c-t>"; action = ":term<cr>i"; }
                { mode = "t"; key = "<esc>"; action = "<c-\\><c-n>"; }

                # Duplicate line.
                { mode = "n"; key = "<c-e>"; action = ":co.<cr>"; }

                # Repeat last action.
                { mode = "n"; key = "<c-a>"; action = "."; }

                # Save.
                { mode = "n"; key = "<c-s>"; action = ":wa<cr>"; }

                # Netrw.
                { mode = "n"; key = "-"; action = ":Ex<cr>"; }
                { mode = "n"; key = "<c-x>"; action = "-"; noremap = false; }

                # Clear highlights.
                { mode = "n"; key = "<esc>"; action = ":nohlsearch<cr>"; }

                # Disable arrow keys in normal mode.
                { mode = "n"; key = "<left>"; action = ":echo 'No, fuck you.'<cr>"; }
                { mode = "n"; key = "<right>"; action = ":echo 'No, fuck you.'<cr>"; }
                { mode = "n"; key = "<up>"; action = ":echo 'No, fuck you.'<cr>"; }
                { mode = "n"; key = "<down>"; action = ":echo 'No, fuck you.'<cr>"; }
            ];
            autocmds = [
                # Hightlight on yank.
                {
                    event = [
                        "TextYankPost"
                    ];
                    callback = lib.mkLuaInline ''
                        function ()
                            vim.hl.on_yank()
                        end
                    '';
                }

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
            opts = {
                # Line numbers.
                number = true;
                relativenumber = false;

                # Case insensitive search, unless an uppercase letter is present.
                ignorecase = true;
                smartcase = true;

                # Mouse mode, e.g. for resizing splits.
                mouse = "a";

                # Undo file.
                undofile = true;

                # No swap file.
                swapfile = false;

                # Show tabs, trailing whitespace, and nbsp.
                list = true;
                listchars = {
                    tab = "» ";
                    trail = "·";
                    nbsp = "␣";
                };

                # Sync yank with system clipboard.
                clipboard = "unnamedplus";

                # Tabs to 4 spaces.
                expandtab = true;
                shiftwidth = 4;
                tabstop = 4;
                softtabstop = 4;

                # Indentation.
                autoindent = true;
                smartindent = true;
            };
            # Random color scheme.
            luaConfigRC.colorScheme = ''
                local colorSchemes = {
                    "catppuccin",
                    "darkblue",
                    "elflord",
                    "lunaperche",
                    "koehler",
                    "murphy",
                    "pablo",
                    "retrobox",
                    "ron",
                    "slate",
                    "vim",
                    "wildcharm",
                    "zaibatsu",
                    "sorbet",
                };

                math.randomseed(os.time())
                local colorScheme = colorSchemes[math.random(#colorSchemes)]
                vim.cmd.colorscheme(colorScheme)
            '';
            # Telescope.
            telescope = {
                enable = true;
                setupOpts.defaults = {
                    file_ignore_patterns = [
                        "build/.*"
                        "bin/.*"
                        "obj/.*"
                        "vendored/.*"
                        "lib/.*"
                        ".git/.*"
                    ];
                    layout_config.horizontal.prompt_position = "bottom";
                    sorting_strategy = "descending";
                    prompt_prefix = "> ";
                };
                mappings = {
                    findFiles = "<space><space>";
                    buffers = "<space>sb";
                    liveGrep = "<space>sg";
                    resume = "<space>sr";
                };
            };
            # Extra plugins.
            startPlugins = with pkgs.vimPlugins; [
                indent-blankline-nvim
                rainbow-delimiters-nvim
                kitty-scrollback-nvim
            ];
            luaConfigRC = {
                telescope = ''
                    -- Find hidden files
                    vim.keymap.set("n", "<space>sh", function ()
                        require("telescope.builtin").find_files({
                            find_command = {
                                "${pkgs.ripgrep.out}/bin/rg",
                                "--files",
                                "--hidden",
                            },
                        })
                    end)
                '';

                indent-blankline = ''
                    require("ibl").setup()
                '';

                rainbow-delimiters = ''
                    require("rainbow-delimiters.setup").setup {
                        strategy = {
                            [""] = "rainbow-delimiters.strategy.global",
                            vim = "rainbow-delimiters.strategy.local",
                        },
                        query = {
                            [""] = "rainbow-delimiters",
                            lua = "rainbow-blocks",
                        },
                        priority = {
                            [""] = 110,
                            lua = 210,
                        },
                        highlight = {
                            "RainbowDelimiterYellow",
                            "RainbowDelimiterBlue",
                            "RainbowDelimiterOrange",
                            "RainbowDelimiterGreen",
                            "RainbowDelimiterViolet",
                            "RainbowDelimiterCyan",
                            "RainbowDelimiterRed",
                        },
                    }
                '';

                kitty-scrollback = ''
                    require("kitty-scrollback").setup()
                '';
            };
            lsp = {
                enable = true;
                mappings = {
                    renameSymbol = "gr";
                    codeAction = "gc";
                    goToDefinition = "gd";
                    goToDeclaration = "gD";
                    signatureHelp = "gs";
                    openDiagnosticFloat = "go";
                    nextDiagnostic = "gn";
                    previousDiagnostic = "gp";
                };
            };
            autocomplete = {
                blink-cmp = {
                    enable = true;
                    setupOpts = {
                        keymap = {
                            preset = "none";
                            "<c-space>" = ["show" "show_documentation" "fallback"];
                            "<c-n>" = ["select_next" "fallback"];
                            "<c-p>" = ["select_prev" "fallback"];
                            "<c-c>" = ["hide" "fallback"];
                            "<c-o>" = ["accept" "fallback"];
                            "<c-s>" = ["show_signature" "hide_signature" "fallback"];
                        };
                        appearance.nerd_font_variant = "mono";
                        fuzzy.implementation = "lua";
                        signature.enabled = true;
                    };
                };
            };
            languages = {
                enableTreesitter = true;
                enableFormat = false;
                csharp = {
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
                cmake = {
                    enable = true;
                };
                json = {
                    enable = true;
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
                css = {
                    enable = true;
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
                    enable = false;
                    extraDiagnostics.enable = true;
                    extensions.markview-nvim = {
                        enable = true;
                        setupOpts.preview.enable = false;
                    };
                };
                qml = {
                    enable = true;
                };
                zig = {
                    enable = true;
                    dap.enable = true;
                };
            };
            luaConfigPost = ''
                -- Disable roslyn "daemon-mode".
                vim.lsp.config("roslyn", {
                    cmd = {
                        "Microsoft.CodeAnalysis.LanguageServer",
                        "--stdio",
                        "--autoLoadProjects",
                    },
                })
            '';
        };
    };
}
