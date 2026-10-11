require("telescope").setup { 
    defaults = {
        file_ignore_patterns = {
            "build/.*",
            "bin/.*",
            "obj/.*",
            "vendored/.*",
            "lib/.*",
        },
    },
}

local telescope = require("telescope.builtin")
vim.keymap.set("n", "<space><space>", telescope.find_files)
vim.keymap.set("n", "<space>sh", ":Telescope find_files hidden=true<cr>", { remap = true, })
vim.keymap.set("n", "<space>sb", telescope.buffers)
vim.keymap.set("n", "<space>sg", telescope.live_grep)
vim.keymap.set("n", "<space>sr", telescope.resume)
