{
  lib,
  setup,
  pkgs,
  ...
}:
{

  # Add app2unit for creating systemd scope units instead of uwsm app, since
  # it is generally faster
  environment = {
    systemPackages = [ pkgs.app2unit ];
    sessionVariables = {
      APP2UNIT_SLICES = "a=app-graphical.slice b=background-graphical.slice s=session-graphical.slice";
    };
  };

  # Enable UWSM to launch hyprland as as systemd unit
  programs.uwsm = {
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
  home-manager.users.${setup.user} = {

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
}
