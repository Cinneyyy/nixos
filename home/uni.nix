{ pkgs, ...}:

{
    home.packages = with pkgs; [
        openjdk25
        checkstyle
    ];
}
