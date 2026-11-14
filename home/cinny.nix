{ pkgs, ...}:
let
    create-instance = i:
        pkgs.writeShellScriptBin "cinny-${i}" ''
            base="$HOME/.local/share/cinny-${i}"
            mkdir -p "$base"/{config,data,cache}

            export XDG_CONFIG_HOME="$base/config"
            export XDG_DATA_HOME="$base/data"
            export XDG_CACHE_HOME="$base/cache"

            exec ${pkgs.cinny-desktop}/bin/cinny "$@"
            '';
in
{
    home.packages = with pkgs; [
        cinny-desktop
        (create-instance "kit.edu")
        (create-instance "cinneyy:colin.monster")
        (create-instance "support:colin.monster")
    ];
}
