{ config, lib, ... }:
let
  cfg = config.nivis.kanata;
  inherit (lib.modules) mkIf;
  inherit (lib.options) mkEnableOption;
in
{

  options.nivis.kanata = {
    enable = mkEnableOption "Enable Kanata to switch Super-Key with Caps-Lock";
  };

  config = mkIf cfg.enable {
    services.kanata = {
      enable = true;
      keyboards.default = {
        config = ''
          (defsrc
            caps
            lmet
          )

          (deflayer start
            lmet
            caps
          )
        '';
      };
    };
  };
}
