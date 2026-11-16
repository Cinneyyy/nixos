{ pkgs, ... }:

{
    programs.nvf.settings.vim = {
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
        luaConfigRC.telescope = ''
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
    };
}
