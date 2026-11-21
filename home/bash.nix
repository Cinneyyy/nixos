_:

{
    programs.bash = {
        enable = true;
        historyFileSize = 100000;
        shellAliases = {
            ls = "ls --color -p";
            la = "ls --color -pA";
            ll = "ls --color -pAlh";
            lsl = "ls --color -plh";

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
            tr = "trash";
            dc = "cd ..";

            pwease = "sudo ";
            kys = "hyprshutdown -t 'Shutting down...' -p 'shutdown now'";

            dnr = "dotnet run";
            dnb = "dotnet build";

            ":3" = "sh -c 'cvlc ~/.config/quickshell/sounds/cats/$(($RANDOM%8)).mp3 --gain 0.33 --play-and-exit &> /dev/null & disown'";
        };
        bashrcExtra = ''
            ffmeta() {
                ffmpeg -i "$1" -c copy -metadata title="$2" -metadata comment="" "$3"
            }

            mk() {
                mkdir "$1" && cd "$1"
            }
        '' + "\n"
        + (builtins.readFile ./dotfiles/bash/zoxide.sh) + "\n"
        + (builtins.readFile ./dotfiles/bash/cd-stack.sh);
    };
}
