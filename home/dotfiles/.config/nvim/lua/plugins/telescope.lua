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
vim.keymap.set("n", "<Space><space>", telescope.find_files)
vim.keymap.set("n", "<Space>sb", telescope.buffers)
vim.keymap.set("n", "<Space>sg", telescope.live_grep)
vim.keymap.set("n", "<Space>sr", telescope.resume)
