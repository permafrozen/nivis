{ inputs, setup, ... }:
{
  imports = [
    ./uwsm.nix
    ./config.nix
    ./plugins.nix
  ];

  # Use the caches built from Cachix
  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  # Use the flake packages
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    package = inputs.hyprland.packages.${setup.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${setup.system}.xdg-desktop-portal-hyprland;
  };
}
