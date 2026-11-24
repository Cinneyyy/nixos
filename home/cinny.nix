{ pkgs, ...}:
let
    create-instance = name:
        pkgs.writeShellScriptBin name ''
            base="$HOME/.local/share/${name}"
            mkdir -p "$base"/{config,data,cache}

            export XDG_CONFIG_HOME="$base/config"
            export XDG_DATA_HOME="$base/data"
            export XDG_CACHE_HOME="$base/cache"

            exec ${pkgs.cinny-desktop}/bin/cinny "$@"
            '';
in
{
    home.packages = [
        (create-instance "cinny0")
        (create-instance "cinny1")
        (create-instance "cinny2")
    ];
}
