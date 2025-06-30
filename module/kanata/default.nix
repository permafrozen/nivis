{ config, lib, ... }:
let
  cfg = config.nivis.kanata;
in
{

  options.nivis.kanata = {
    enable = lib.mkEnableOption "Enable Kanata to switch Super-Key with Caps-Lock";
  };

  config = lib.mkIf cfg.enable {
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
