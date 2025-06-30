{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nivis.xanmod;
in
{
  options.nivis.xanmod = {
    enable = lib.mkEnableOption "Enable the linux xanmod kernel";
  };

  config = lib.mkIf cfg.enable {
    boot = {
      kernelPackages = pkgs.linuxPackages_xanmod;
      kernelParams = [ "button.lid_init_state=open" ];
    };
  };
}
