{
  config,
  lib,
  setup,
  ...
}:
let
  cfg = config.nivis.hyprland;
in
{
  options.nivis.hyprland = {
    enable = lib.mkEnableOption "enables the configured wayland compositor hyprland";
    enableUWSM = lib.mkEnableOption "enables UWSM and support for hyprland";
  };

  config = lib.mkIf cfg.enable {

    programs.uwsm = lib.mkIf cfg.enableUWSM {
      enable = true; # Uses the dbus-broker implementation automatically
      waylandCompositors = {
        hyprland = lib.mkDefault {
          prettyName = "hyprland";
          comment = "Hyprland compositor managed by UWSM";
          binPath = "/run/current-system/sw/bin/hyprland";
        };
      };
    };

    home-manager.users.${setup.user} = lib.mkIf cfg.enableUWSM {
      home.file."profile" = {
        target = ".profile";
        text = ''
          if uwsm check may-start; then
            exec uwsm start -S hyprland-uwsm.desktop
          fi
        '';
      };
    };

    programs.hyprland = {
      enable = true;
      withUWSM = lib.mkIf cfg.enableUWSM true;
    };
  };
}
