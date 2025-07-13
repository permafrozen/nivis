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

    hyprland.url = "github:hyprwm/Hyprland";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    hypr-dynamic-cursors = {
      url = "github:VirtCode/hypr-dynamic-cursors";
      inputs.hyprland.follows = "hyprland"; # to make sure that the plugin is built for the correct version of hyprland
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

    schnell = {
      url = "github:permafrozen/schnell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, ... }@inputs:
    {
      nixosConfigurations = {
        "laptop" =
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
