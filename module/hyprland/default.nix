{
  config,
  lib,
  ...
}:
let
  cfg = config.nivis.hyprland;
in
{
  imports = [
    ./uwsm.nix
    ./config.nix
  ];

  options.nivis.hyprland = {
    enable = lib.mkEnableOption "enables the configured wayland compositor hyprland";
    monitors = lib.mkOption {
      default = [ ];
      type = with lib.types; listOf str;
    };
  };

  config = lib.mkIf cfg.enable {

    _module.args = {
      inherit cfg;
    };

    programs.hyprland = {
      enable = true;
      withUWSM = true;
    };
  };
}
