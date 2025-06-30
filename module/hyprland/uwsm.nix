{
  config,
  lib,
  cfg,
  setup,
  ...
}:
{
  options.nivis.hyprland = {
    enableUWSM = lib.mkEnableOption "enables UWSM to launch hyprland as a systemd unit";
  };

  config = {
    # Enable UWSM to launch hyprland as as systemd unit
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

    # Autostart into Hyprland when logging in
    home-manager.users.${setup.user} = lib.mkIf cfg.enableUWSM {

      # # Fish autostart
      # programs.fish.loginShellInit = lib.mkIf config.nivis.fish.enable ''
      #   if uwsm check may-start
      #       exec uwsm start -S hyprland-uwsm.desktop
      #   end
      # '';

      # POSIX autostart
      home.file."profile" = {
        target = ".profile";
        text = ''
          if uwsm check may-start; then
            exec uwsm start -S hyprland-uwsm.desktop
          fi
        '';
      };
    };
  };
}
