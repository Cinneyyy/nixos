-- Move line(s) up/down
vim.keymap.set("n", "<c-j>", ":m .+1<cr>==")
vim.keymap.set("n", "<c-k>", ":m .-2<cr>==")
vim.keymap.set("v", "<c-j>", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "<c-k>", ":m '<-2<cr>gv=gv")

-- Terminal
vim.keymap.set("n", "<c-t>", ":term<cr>i", { remap = true, })

-- Duplicate line
vim.keymap.set("n", "<c-e>", ":co.<cr>", { remap = true, })

-- Repeat last action
vim.keymap.set("n", "<c-a>", ".", { remap = true, })

-- Save (all)
vim.keymap.set("n", "<c-s>", ":wa<cr>")

-- Netrw
vim.keymap.set("n", "-", vim.cmd.Ex)
vim.keymap.set("n", "<c-x>", "-", { remap = true, })

-- Clear highlights
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>")

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", ":echo 'no, fuck you'<cr>")
vim.keymap.set("n", "<right>", ":echo 'no, fuck you'<cr>")
vim.keymap.set("n", "<up>", ":echo 'no, fuck you'<cr>")
vim.keymap.set("n", "<down>", ":echo 'no, fuck you'<cr>")
