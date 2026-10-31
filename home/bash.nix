_:

{
    programs.bash = {
        enable = true;
        historyFileSize = 100000;
        shellAliases = {
            ll = "ls -lahp";
            la = "ls -ap";
            ls = "ls -p";

            commit = "git add . && git commit -m";
            push = "git push -u";

            nv = "nvim .";
            bashh = "nvim ~/.bash_history";
            cloc = "cloc .";
            ff = "fastfetch";
            tr = "trash";

            dnr = "dotnet run";
            dnb = "dotnet build";
        };
        bashrcExtra = ''
            ffmeta() {
                ffmpeg -i "$1" -c copy -metadata title="$2" -metadata comment="" "$3"
            }
        '' + "\n"
        + (builtins.readFile ./dotfiles/bash/zoxide.sh) + "\n"
        + (builtins.readFile ./dotfiles/bash/cd-stack.sh);
    };
}
