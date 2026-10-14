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
                { mode = "v"; key = "<c-j>"; action = ":m '<+1<cr>gv=gv"; }
                { mode = "v"; key = "<c-k>"; action = ":m '<-2<cr>gv=gv"; }

                # Open terminal.
                { mode = "n"; key = "<c-t>"; action = ":term<cr>i"; }

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
                # Tab => 4 spaces.
                {
                    event = [
                        "FileType"
                    ];
                    callback = lib.mkLuaInline ''
                        function ()
                            vim.opt_local.expandtab = true;
                            vim.opt_local.tabstop = 4;
                            vim.opt_local.shiftwidth = 4;
                            vim.opt_local.softtabstop = 4;
                        end
                    '';
                }

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

                # Show tabs, trailing whitespace, and nbsp.
                list = true;
                listchars = {
                    tab = "» ";
                    trail = "·";
                    nbsp = "␣";
                };

                # Sync yank with system clipboard.
                clipboard = "unnamedplus";
            };
            # Random color scheme.
            luaConfigRC.colorScheme = ''
                local colorSchemes = {
                    "catppuccin",
                    "darkblue",
                    "elflord",
                    "industry",
                    "lunaperche",
                    "koehler",
                    "murphy",
                    "pablo",
                    "retrobox",
                    "ron",
                    "slate",
                    "sorbet",
                    "vim",
                    "wildcharm",
                    "zaibatsu",
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
            ];
            luaConfigRC = {
                # Find hidden files.
                telescope = ''
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
                            "RainbowDelimiterRed",
                            "RainbowDelimiterYellow",
                            "RainbowDelimiterBlue",
                            "RainbowDelimiterOrange",
                            "RainbowDelimiterGreen",
                            "RainbowDelimiterViolet",
                            "RainbowDelimiterCyan",
                        },
                    }
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
                    mappings = {
                        complete = "<c-space>";
                        next = "<c-n>";
                        previous = "<c-p>";
                        confirm = "<c-o>";
                        close = "<c-c>";
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
                    enable = true;
                    extraDiagnostics.enable = true;
                    extensions.markview-nvim = {
                        enable = true;
                        setupOpts.preview.enable = false;
                    };
                };
                qml = {
                    enable = true;
                };
            };
        };
    };
}
