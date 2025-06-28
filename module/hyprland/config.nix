{
  config,
  lib,
  cfg,
  setup,
  ...
}:
{
  options.nivis.hyprland = {

  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${setup.user} = {
      wayland.windowManager.hyprland = {
        enable = true;
        settings = {
          "$1mod" = "SUPER";
          "$2mod" = "SUPER_ALT";

          bind =
            [
              "$1mod, M, exit,"
            ]
            ++ [
              (lib.mkIf config.nivis.foot.enable "$1mod, T, exec, foot")
              (lib.mkIf config.nivis.contour.enable "$1mod, T, exec, contour")
              (lib.mkIf config.nivis.kitty.enable "$1mod, T, exec, kitty")
            ];
        };
      };
    };
  };
}
