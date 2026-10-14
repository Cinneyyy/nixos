{
    description = "NixOS config.";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

        home-manager = {
            url = "github:nix-community/home-manager/release-26.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nvf = {
            url = "github:notashelf/nvf";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, home-manager, nvf, ... }: {
        nixosConfigurations = {
            pc = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./hosts/pc
                    home-manager.nixosModules.home-manager {
                        home-manager = {
                            users.colin = import ./hosts/pc/home.nix;
                            sharedModules = [
                                nvf.homeManagerModules.default
                            ];
                        };
                    }
                ];
            };
            laptop = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./hosts/laptop
                    home-manager.nixosModules.home-manager {
                        home-manager = {
                            users.colin = import ./hosts/laptop/home.nix;
                            sharedModules = [
                                nvf.homeManagerModules.default
                            ];
                        };
                    }
                ];
            };
        };
    };
}
