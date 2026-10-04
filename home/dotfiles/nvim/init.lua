vim.keymap.set("n", "<C-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '-', vim.cmd.Ex)
vim.keymap.set("n", "<C-t>", ":term<CR>", { remap = true })
vim.keymap.set("n", "ci2", "ci\"")

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
    end
})

vim.o.number = true
vim.o.relativenumber = false

vim.o.mouse = 'a'

vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- waow (testtesttest)
