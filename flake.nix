{
  description = "nixos configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, ... }@inputs:
    {
      nixosConfigurations = {
        laptop =
          let
            setup = {
              user = "matteo";
              host = "laptop";
              system = "x86_64-linux";
            };
          in
          nixpkgs.lib.nixosSystem {
            system = setup.system;
            specialArgs = {
              inherit setup;
              inherit inputs;
              libExtra = import ./lib { lib = nixpkgs.lib; };
            };
            modules = [
              inputs.home-manager.nixosModules.home-manager
              ./host/laptop/default.nix
            ];
          };
      };
    };
}
