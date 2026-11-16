_:

{
    programs.nvf.settings.vim.opts = {
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

        # Disable, since mode is in status line.
        showmode = false;
    };
}
