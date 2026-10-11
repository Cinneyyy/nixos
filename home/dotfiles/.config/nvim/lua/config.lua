-- Tab -> 4 spaces
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
    end
})

-- Line numbers
vim.o.number = true
vim.o.relativenumber = false

-- Case insensitive search, unless an uppercase letter is present
vim.o.ignorecase = true
vim.o.smartcase = true

-- Mouse mode
vim.o.mouse = 'a'

-- Undo file
vim.o.undofile = true

-- Sync yank with system clipboard
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function ()
        vim.hl.on_yank()
    end
})

-- Show tabs, trailing whitespace, and nbsp
vim.o.list = true;
vim.opt.listchars = {
    tab = "» ",
    trail = "·",
    nbsp = "␣",
}
