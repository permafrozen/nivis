{
  config,
  lib,
  setup,
  ...
}:
let
  cfg = config.nivis.foot;
  inherit (lib.modules) mkIf;
  inherit (lib.options) mkEnableOption;
in
{
  options.nivis.foot = {
    enable = mkEnableOption "Enable the lightweight wayland terminal called foot";
  };

  config = mkIf cfg.enable {
    home-manager.users.${setup.user} = {
      programs.foot = {
        enable = true;
        settings = {

        };
      };
    };
  };
}
