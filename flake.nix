{
  description = "final nixos configuration flake";

  outputs =
    { nixpkgs, ... }@inputs:
    {
      nixosConfigurations.nixos =
        let
          setup = {
            user = "matteo";
            host = "nixos";
            system = "x86_64-linux";
            time = "Europe/Vienna";
            layout = "de";
            locale = "de_AT.UTF-8";
          };
        in
        nixpkgs.lib.nixosSystem {
          system = setup.system;
          specialArgs = {
            inherit setup;
            inherit inputs;
            libExtra = import ./configuration/lib { lib = nixpkgs.lib; };
          };
          modules = [
            ./configuration
          ]
          ++ (with inputs; [
            home-manager.nixosModules.home-manager
            nur.modules.nixos.default
            stylix.nixosModules.stylix
            nixvim.nixosModules.nixvim
          ]);
        };
    };

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

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
