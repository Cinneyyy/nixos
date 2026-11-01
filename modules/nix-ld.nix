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
        ];
    };
}
