{ pkgs, ... }:

let
    screenkey-nvim = pkgs.vimUtils.buildVimPlugin {
        pname = "screenkey.nvim";
        version = "unstable";
        src = pkgs.fetchFromGitHub {
            owner = "NStefan002";
            repo = "screenkey.nvim";
            rev = "main";
            hash = "sha256-VCK4s4uSqnmGP7u4KuQsNrkt+NCR5oJf036cKEBO+yo=";
        };
    };
in
{
    programs.nvf.settings.vim = {
        extraPlugins.screenkey = {
            package = screenkey-nvim;
            setup = ''
                require("screenkey").setup {
                    compress_after = 3,
                    clear_after = 20,
                }
            '';
        };
    };
}
