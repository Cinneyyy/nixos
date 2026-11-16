_:

{
    programs.nvf.settings.vim.keymaps = [
        # Move lines(s) up/down with CTRL+j/k.
        { mode = "n"; key = "<c-j>"; action = ":m .+1<cr>=="; }
        { mode = "n"; key = "<c-k>"; action = ":m .-2<cr>=="; }
        { mode = "v"; key = "<c-j>"; action = ":m '>+1<cr>gv=gv"; }
        { mode = "v"; key = "<c-k>"; action = ":m '<-2<cr>gv=gv"; }

        # Open and navigate terminal.
        { mode = "n"; key = "<c-t>"; action = ":term<cr>i"; }
        { mode = "t"; key = "<esc>"; action = "<c-\\><c-n>"; }

        # Duplicate lisne.
        { mode = "n"; key = "<c-e>"; action = ":co.<cr>"; }

        # Repeat last action.
        { mode = "n"; key = "<c-a>"; action = "."; }

        # Save.
        { mode = "n"; key = "<c-s>"; action = ":wa<cr>"; }

        # Netrw.
        { mode = "n"; key = "-"; action = ":Ex<cr>"; }
        { mode = "n"; key = "<c-x>"; action = "-"; noremap = false; }

        # Clear highlights.
        { mode = "n"; key = "<esc>"; action = ":nohlsearch<cr>"; }

        # Disable arrow keys in normal mode.
        { mode = "n"; key = "<left>"; action = ":echo 'No, fuck you.'<cr>"; }
        { mode = "n"; key = "<right>"; action = ":echo 'No, fuck you.'<cr>"; }
        { mode = "n"; key = "<up>"; action = ":echo 'No, fuck you.'<cr>"; }
        { mode = "n"; key = "<down>"; action = ":echo 'No, fuck you.'<cr>"; }

        # Misc. shortcuts
        { mode = "n"; key = "<space>tm"; action = ":Markview<cr>"; }
        { mode = "n"; key = "<space>tt"; action = ":TypstPreview<cr>"; }
    ];
}
