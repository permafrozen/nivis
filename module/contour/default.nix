{
  config,
  lib,
  pkgs,
  setup,
  ...
}:
let
  cfg = config.nivis.contour;
in
{
  options.nivis.contour = {
    enable = lib.mkEnableOption "enable the modern c++ contour terminal emulator";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ pkgs.contour ];
    # home-manager.users.${setup.user} = {
    #   home.file."contour" = {
    #     target = ".config/contour/contour.yml";
    #     text = ''

    #     '';
    #   };
    # };
  };
}
