{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nivis.contour;
  inherit (lib.modules) mkIf;
  inherit (lib.options) mkEnableOption;
in
{
  options.nivis.contour = {
    enable = mkEnableOption "enable the modern c++ contour terminal emulator";
  };

  config = mkIf cfg.enable { environment.systemPackages = [ pkgs.contour ]; };
}
