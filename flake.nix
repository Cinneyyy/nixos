{
    description = "NixOS config.";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    };

    outputs = { self, nixpkgs, ... }: {
        nixosConfigurations = {
            my-machine = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";

                modules = [
                    ./configuration.nix
                ];
            };
        };
    };
}
