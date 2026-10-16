{ pkgs, ...}:
let
    sdlLibs = with pkgs; [
        sdl3
        wayland
        libxkbcommon
        libdecor
        libGL
        libX11
        libxext
        libxcursor
        libxi
        libxrandr
    ];
in
{
    home.packages = sdlLibs;

    home.sessionVariables.LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath sdlLibs;

    # I hate this.
    programs.bash.bashrcExtra = ''
        unset __HM_SESS_VARS_SOURCED
        . "/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh"
    '';
}
