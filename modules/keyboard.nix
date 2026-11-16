_:

{
    console.keyMap = "de";

    services.keyd = {
        enable = true;
        keyboards.default = {
            ids = [
                "*"
            ];
            settings.main = {
                z = "y";
                y = "z";

                capslock = "esc";
            };
        };
    };
}
