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
