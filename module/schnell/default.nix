{
  config,
  lib,
  inputs,
  setup,
  ...
}:
let
  cfg = config.nivis.schnell;
  inherit (lib.modules) mkIf;
  inherit (lib.options) mkEnableOption;
in
{
  options.nivis.schnell = {
    enable = mkEnableOption "Enable the Schnell Desktop Shell";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ inputs.schnell.packages.${setup.system}.default ];
  };
}
