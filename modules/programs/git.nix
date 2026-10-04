{ ... }:

{
    programs.git = {
        enable = true;
        settings = {
            user = {
                email = "cinneyyy@proton.me";
                name = "Cinneyyy";
            };
            init.defaultBranch = "main";
        };
    };
}
