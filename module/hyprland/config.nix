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

          # Cursor resize/move
          bindm = [
            "$1mod, mouse:272, movewindow"
            "$1mod, mouse:273, resizewindow"
          ];

          misc = {
            disable_hyprland_logo = "true";
            disable_splash_rendering = "true";
          };

          bind =
            [
              # window/session killing
              "$1mod, Q, killactive,"
              "$1mod, M, exit,"

              # Windowfocus Controls
              "$1mod, H, movefocus, l"
              "$1mod, J, movefocus, d"
              "$1mod, K, movefocus, u"
              "$1mod, L, movefocus, r"

              # move to workspace
              "$1mod, 1, workspace, 1"
              "$1mod, 2, workspace, 2"
              "$1mod, 3, workspace, 3"
              "$1mod, 4, workspace, 4"
              "$1mod, 5, workspace, 5"
              "$1mod, 6, workspace, 6"
              "$1mod, 7, workspace, 7"
              "$1mod, 8, workspace, 8"
              "$1mod, 9, workspace, 9"
              "$1mod, 0, workspace, 10"

              # move active window to workspace
              "$2mod, 1, movetoworkspacesilent, 1"
              "$2mod, 2, movetoworkspacesilent, 2"
              "$2mod, 3, movetoworkspacesilent, 3"
              "$2mod, 4, movetoworkspacesilent, 4"
              "$2mod, 5, movetoworkspacesilent, 5"
              "$2mod, 6, movetoworkspacesilent, 6"
              "$2mod, 7, movetoworkspacesilent, 7"
              "$2mod, 8, movetoworkspacesilent, 8"
              "$2mod, 9, movetoworkspacesilent, 9"
              "$2mod, 0, movetoworkspacesilent, 10"
            ]
            ++ [
              # open enabled terminal
              (lib.mkIf config.nivis.foot.enable "$1mod, T, exec, foot")
              (lib.mkIf config.nivis.contour.enable "$1mod, T, exec, contour")
              (lib.mkIf config.nivis.kitty.enable "$1mod, T, exec, kitty")
            ];

          input = {
            touchpad.disable_while_typing = false;
            kb_layout = "de";
            mouse_refocus = false;
            follow_mouse = "0";
          };
        };
      };
    };
  };
}
