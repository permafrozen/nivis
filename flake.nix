{
  description = "personal nixos configuration flake";

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
            libExtra = import ./src/lib { lib = nixpkgs.lib; };
          };
          modules = [
            ./src
          ]
          ++ (with inputs; [
            home-manager.nixosModules.home-manager
            nur.modules.nixos.default
            stylix.nixosModules.stylix
            optnix.nixosModules.optnix
            spicetify-nix.nixosModules.spicetify
          ]);
        };
    };

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };

    nur = {
      url = "github:nix-community/NUR";
    };

    optnix = {
      url = "github:water-sucks/optnix";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
    };

    ghostty = {
      url = "github:ghostty-org/ghostty";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    shell = {
      url = "github:permafrozen/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ren = {
      url = "github:permafrozen/ren";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
