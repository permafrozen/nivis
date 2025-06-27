{ config, lib, ... }:
let
  cfg = config.nivis.keyboard;
in
{
  options.nivis.keyboard = {
    enable = lib.mkEnableOption "enable keyboard configuration module";
    layout = lib.mkOption {
      type = lib.types.str;
      default = "en";
    };
  };

  config = lib.mkIf cfg.enable {
    # keyboard layout (xserver)
    services.xserver.xkb = {
      layout = cfg.layout;
      variant = "";
    };

    # keyboard layout (tty)
    console.keyMap = cfg.layout;
  };
}
