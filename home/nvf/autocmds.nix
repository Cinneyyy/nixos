{ lib, ... }:

{
    programs.nvf.settings.vim.autocmds = [
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

        # Set tab to 4 spaces regardless of file type.
        {
            event = [
                "FileType"
            ];
            callback = lib.mkLuaInline ''
                function ()
                    vim.opt_local.expandtab = true
                    vim.opt_local.tabstop = 4
                    vim.opt_local.shiftwidth = 4
                    vim.opt_local.softtabstop = 4
                end
            '';
        }

        # # Java checkstyle.
        # {
        #     event = [
        #         "FileType"
        #     ];
        #     pattern = [
        #         "java"
        #     ];
        #     callback = lib.mkLuaInline ''
        #         function ()
        #         end
        #     '';
        # }
    ];
}
