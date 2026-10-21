{ ... }:

{
    programs.bash = {
        enable = true;
        shellAliases = {
            ll = "ls -lah";
            la = "ls -a";

            commit = "git add . && git commit -m";
            push = "git push -u";

            nv = "nvim .";
            bashh = "nvim ~/.bash_history";
            cloc = "cloc .";
            ff = "fastfetch";
            c = "z";
        };
        initExtra = ''
            eval "$(zoxide init bash)"

            ffmeta() {
                ffmpeg -i "$1" -c copy -metadata title="$2" -metadata comment="" "$3"
            }
        '';
    };
}
