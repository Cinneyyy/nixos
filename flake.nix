{
    description = "NixOS config.";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
        nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

        home-manager = {
            url = "github:nix-community/home-manager/release-26.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nvf = {
            url = "github:notashelf/nvf";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        steam-config = {
            url = "github:different-name/steam-config-nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, nixpkgs-unstable, home-manager, nvf, steam-config, ... }:
    let
        roslynOverlay = _: prev: {
            inherit (import nixpkgs-unstable {
                system = prev.stdenv.hostPlatform.system;
            }) roslyn-ls;
        };
    in
    {
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
                                steam-config.homeModules.default
                            ];
                        };
                    }
                    {
                        nixpkgs.overlays = [
                            roslynOverlay
                        ];
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
                                steam-config.homeModules.default
                            ];
                        };
                    }
                    {
                        nixpkgs.overlays = [
                            roslynOverlay
                        ];
                    }
                ];
            };
        };
    };
}
