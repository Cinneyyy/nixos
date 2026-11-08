{ pkgs, ... }:

{
    programs.nix-ld = {
        enable = true;
        libraries = with pkgs; [
            (with dotnetCorePackages; combinePackages [
                sdk_8_0
                sdk_9_0
                sdk_10_0
                sdk_11_0
            ])
            sdl3
            sdl3-image
            sdl3-ttf
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
    };
}
