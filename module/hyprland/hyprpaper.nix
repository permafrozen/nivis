{
  cfg,
  setup,
  lib,
  ...
}:
let
  inherit (lib.modules) mkIf;
  inherit (lib.options) mkEnableOption mkOption;
  inherit (lib.types) path;
in
{
  options.nivis.hyprland.hyprpaper = {
    enable = mkEnableOption "Enable hyprpaper";
    wallpaper = mkOption {
      type = path;
      default = ../../asset/alps.png;
    };
  };

  config = mkIf cfg.hyprpaper.enable {
    home-manager.users.${setup.user} = {
      services.hyprpaper = {
        enable = true;
        settings = {
          ipc = "on";
          splash = false;
          splash_offset = 2.0;

          preload = [
            "${cfg.hyprpaper.wallpaper}"
          ];

          wallpaper = [
            ",${cfg.hyprpaper.wallpaper}"
          ];
        };
      };
    };
  };
}
