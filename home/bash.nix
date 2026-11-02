_:

{
    programs.bash = {
        enable = true;
        historyFileSize = 100000;
        shellAliases = {
            ls = "ls --color -p";
            la = "ls --color -pA";
            ll = "ls --color -pAlh";

            gadd = "git add .";
            gcommit = "git add . && git commit -m";
            gpush = "git push -u";
            gpull = "git pull";
            gfetch = "git fetch";
            gstatus = "git status";
            gdiff = "git diff";
            gclone = "git clone";

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

            mgd() {
                mkdir "$1" && cd "$1"
            }
        '' + "\n"
        + (builtins.readFile ./dotfiles/bash/zoxide.sh) + "\n"
        + (builtins.readFile ./dotfiles/bash/cd-stack.sh);
    };
}
