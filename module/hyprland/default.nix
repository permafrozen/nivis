{
  config,
  lib,
  inputs,
  setup,
  ...
}:
let
  cfg = config.nivis.hyprland;
in
{
  imports = [
    ./uwsm.nix
    ./config.nix
    ./hyprpaper.nix
    ./plugins.nix
  ];

  options.nivis.hyprland = {
    enable = lib.mkEnableOption "enables the configured wayland compositor hyprland";
    monitors = lib.mkOption {
      default = [ ];
      type = with lib.types; listOf str;
    };
  };

  config = lib.mkIf cfg.enable {

    # All Imports inherit cfg
    _module.args = {
      inherit cfg;
    };

    # Use the caches build from Cachix
    nix.settings = {
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };

    programs.hyprland = {
      enable = true;
      withUWSM = true;

      # Use the Flake packages
      package = inputs.hyprland.packages.${setup.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${setup.system}.xdg-desktop-portal-hyprland;
    };
  };
}
