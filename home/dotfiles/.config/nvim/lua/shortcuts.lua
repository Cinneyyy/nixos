-- Move line(s) up/down
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- Terminal
vim.keymap.set("n", "<C-t>", ":term<CR>", { remap = true, })

-- Duplicate line
vim.keymap.set("n", "<C-e>", ":co.<CR>", { remap = true, })

-- Repeat last action
vim.keymap.set("n", "<C-a>", ".", { remap = true, })

-- Save (all)
vim.keymap.set("n", "<C-s>", ":wa<CR>")

-- NetRw
vim.keymap.set("n", "-", vim.cmd.Ex)
vim.keymap.set("n", "<C-x>", "-", { remap = true, })

-- Clear highlights
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")
