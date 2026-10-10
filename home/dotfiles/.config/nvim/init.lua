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

-- Clear highlights
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")

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

-- Color schemes
local colorSchemes = {
    "catppuccin",
    "darkblue",
    "desert",
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

-- Telescope
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

-- Lsp, autocomplete
-- vim.api.nvim_create_autocmd("LspAttach", {
--     group = vim.api.nvim_create_augroup("lsp-attach", { clear = true, }),
--     callback = function (event)
--         local map = function (keys, func, mode)
--             vim.keymap.set(mode or "n", keys, func, {
--                 buffer = event.buf,
--             })
--         end
--
--         map("grn", vim.lsp.buf.rename)
--         map("gca", vim.lsp.buf.code_action)
--         map("gD", vim.lsp.buf.declaration)
--
--         -- Highlight references of word under cursor
--         local client = vim.lsp.get_client_by_id(event.data.client_id)
--         if client and client:supports_method("textDocument/documentHighlight", event.buf) then
--             local highlightAugroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false, })
--             vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI", }, {
--                 buffer = event.buf,
--                 group = hightlightAugroup,
--                 callback = vim.lsp.buf.document_highlight,
--             })
--
--             vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", }, {
--                 buffer = event.buf,
--                 group = highlightAugroup,
--                 callback = vim.lsp.buf.clear_references,
--             })
--
--             vim.api.nvim_create_autocmd("LspDetach", {
--                 group = vim.api.nvim_create_augroup("lsp-detach", { clear = true, }),
--                 callback = function (event2)
--                     vim.lsp.buf.clear_references()
--                     vim.api.nvim_clear_autocmds {
--                         group = "lsp-highlight",
--                         buffer = event2.buf,
--                     }
--                 end,
--             })
--         end
--
--         -- Inlay hints
--         if client and client:supports_method("textDocument/inlayHint", event.buf) then
--             map("glh", function ()
--                 vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled {
--                     bufnr = event.buf,
--                 })
--             end)
--         end
--     end,
-- })
--
-- -- Associate file types with certain LSPs
-- vim.filetype.add({
--     extension = {
--         mcfunction = "mcfunction",
--         h = "c",
--     }
-- })
--
-- local servers = {
--     clangd = { cmd = { "clangd", }, }, -- Cxx
--     lemminx = { cmd = { "lemminx", }, }, -- XML
--     jsonls = { cmd = { "vscode-json-language-server", "-- stdio", }, }, -- JSON
--     html = { cmd = { "vscode-html-language-server", "-- stdio", }, }, -- HTML
--     cssls = { cmd = { "vscode-css-language-server", "-- stdio", }, }, -- CSS
--     vtsls = { cmd = { "vtsls", "-- stdio", }, }, -- JS, TS
--     -- spyglassmc_language_server = {}, -- mcfunction
--     roslynls = { cmd = { "", }, }, -- C#
--     lua_ls = {
--         cmd = { "lua-language-server", },
--         on_init = function (client)
--             client.server_capabilities.documentFormattingProvider = false
--
--             if client.workspace_folders then
--                 local path = client.workspace_folders[1].name
--                 if path ~= vim.fn.stdpath 'config' and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then
--                     return
--                 end
--             end
--
--             client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
--                 runtime = {
--                     version = 'LuaJIT',
--                     path = { 'lua/?.lua', 'lua/?/init.lua' },
--                 },
--             })
--         end,
--         settings = {
--             Lua = {
--                 format = { enable = false },
--             },
--         },
--     },
-- }
--
-- require("mason").setup {
--     -- registries = {
--     --     "github:mason-org/mason-registry",
--     --     "github:Crashdummyy/mason-registry",
--     -- },
-- }
--
-- -- local ensureInstalled = {
-- --     "clangd",
-- --     "lemminx",
-- --     "json-lsp",
-- --     "html-lsp",
-- --     "css-lsp",
-- --     "vtsls",
-- --     "lua-language-server",
-- --     "spyglassmc-language-server",
-- -- }
-- --
-- -- require("mason-tool-installer").setup {
-- --     ensure_installed = ensureInstalled,
-- -- }
--
-- for name, server in pairs(servers) do
--     vim.lsp.config(name, server)
--     vim.lsp.enable(name)
-- end
--
-- require("blink.cmp").setup {
--     keymap = {
--         preset = "none",
--         ["<C-Space>"] = { "show", "show_documentation", "hide_documentation", "fallback" },
--         ["<C-n>"] = { "select_next", "fallback", },
--         ["<C-p>"] = { "select_prev", "fallback", },
--         ["<C-c>"] = { "hide", "fallback", },
--         ["<C-o>"] = { "accept", "fallback", },
--         ["<C-s>"] = { "show_signature", "hide_signature", "fallback", },
--     },
--     appearance = {
--         nerd_font_variant = "mono",
--     },
--     completion = {
--         documentation = {
--             auto_show = false,
--         },
--     },
--     sources = {
--         default = { "lsp", "path", }
--     },
--     fuzzy = {
--         implementation = "lua",
--     },
--     signature = {
--         enabled = true,
--     },
-- }
--
-- -- Treesitter (syntax highlighting)
-- -- local parsers = {
-- --     "bash",
-- --     "c",
-- --     "diff",
-- --     "html",
-- --     "lua",
-- --     "luadoc",
-- --     "markdown",
-- --     "markdown_inline",
-- --     "query",
-- --     "vim",
-- --     "vimdoc",
-- -- }
-- require("nvim-treesitter").install(parsers)
--
-- - Enable treesitter based folds
--     -- For more info on folds see `:help folds`
--     -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
--     -- vim.wo.foldmethod = 'expr'
--
--     -- Check if treesitter indentation is available for this language, and if so enable it
--     -- in case there is no indent query, the indentexpr will fallback to the vim's built in one
--     local has_indent_query = vim.treesitter.query.get(language, 'indents') ~= nil
--
--     -- Enable treesitter based indentation
--     if has_indent_query then vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" end
--   end
--
--   local available_parsers = require('nvim-treesitter').get_available()
--   vim.api.nvim_create_autocmd('FileType', {
--     callback = function(args)
--       local buf, filetype = args.buf, args.match
--
--       local language = vim.treesitter.language.get_lang(filetype)
--       if not language then return end
--
--       local installed_parsers = require('nvim-treesitter').get_installed 'parsers'
--
--       if vim.tbl_contains(installed_parsers, language) then
--         -- Enable the parser if it is already installed
--         treesitter_try_attach(buf, language)
--       elseif vim.tbl_contains(available_parsers, language) then
--         -- If a parser is available in `nvim-treesitter`, auto-install it and enable it after the installation is done
--         require('nvim-treesitter').install(language):await(function() treesitter_try_attach(buf, language) end)
--       else
--         -- Try to enable treesitter features in case the parser exists but is not available from `nvim-treesitter`
--         treesitter_try_attach(buf, language)
--       end
--     end,
--   })
