{
  config,
  lib,
  setup,
  ...
}:
let
  cfg = config.nivis.discord;
  inherit (lib.modules) mkIf;
  inherit (lib.options) mkEnableOption;
in
{
  options.nivis.discord = {
    enable = mkEnableOption "Enable the Discord client with Vesktop modifications";
  };
  config = mkIf cfg.enable {
    home-manager.users.${setup.user} = {
      programs.vesktop.enable = true;
    };
  };
}
