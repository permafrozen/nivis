{
  config,
  lib,
  setup,
  ...
}:
let
  cfg = config.nivis.foot;
in
{
  options.nivis.foot = {
    enable = lib.mkEnableOption "Enable the lightweight wayland terminal called foot";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${setup.user} = {
      programs.foot = {
        enable = true;
        settings = {

        };
      };
    };
  };
}
