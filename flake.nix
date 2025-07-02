{
  description = "nixos configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nur.url = "github:nix-community/NUR";
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
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
              inputs.nur.modules.nixos.default
              inputs.stylix.nixosModules.stylix
              ./host/laptop/default.nix
            ];
          };
      };
    };
}
