{ setup, ... }:
{
  home-manager.users.${setup.user} = {
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        general = {
          allow_tearing = true;
        };

        decoration = {
          rounding = 20;
        };

        ecosystem = {
          no_update_news = true;
          no_donation_nag = true;
        };

        misc = {
          disable_hyprland_logo = "true";
          disable_splash_rendering = "true";
        };

        input = {
          touchpad.disable_while_typing = false;
          kb_layout = "de";
          mouse_refocus = false;
          follow_mouse = "0";
        };

        monitor = [
          "eDP-1, 1920x1080@60, 0x0, 1"
          "HDMI-A-1, 1920x1080@60, 0x-1080, 1"
          # "HDMI-A-1, 1920x1080@60, auto, 1, mirror, eDP-1"
        ];

        "$1mod" = "SUPER";
        "$2mod" = "SUPER_ALT";

        # Animations
        bezier = "easeOutQuint, 0.22, 1, 0.36, 1";
        animation = [
          "layers, 1, 8, easeOutQuint, slide"
          "windows, 1, 8, easeOutQuint, slide"
          "workspaces, 1, 4, easeOutQuint, slide"
        ];

        exec-once = [ "app2unit -s s shell" ];

        # Cursor resize/move
        bindm = [
          "$1mod, mouse:272, movewindow"
          "$1mod, mouse:273, resizewindow"
        ];

        # Disable Scroll delay for cleaner zooming
        binds = {
          scroll_event_delay = 0;
        };

        # Zoom Keyboard binding
        binde = [
          "$1mod, minus, exec, hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor | awk '/^float.*/ {print $2 * 0.9}')"
          "$1mod, plus, exec, hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor | awk '/^float.*/ {print $2 * 1.1}')"
        ];

        bind = [
          # applications
          "$1mod, T, exec, ghostty"
          "$1mod, S, exec, app2unit -s a zen-beta"
          "$1mod, A, global, shell:runner"
          "$1mod, PRINT, exec, hyprshot -m region --clipboard-only"

          # window/session killing
          "$1mod, Q, killactive,"
          "$1mod, M, exit,"

          # windowfocus Controls
          "$1mod, H, movefocus, l"
          "$1mod, J, movefocus, d"
          "$1mod, K, movefocus, u"
          "$1mod, L, movefocus, r"
          "$1mod, F, fullscreen, 0"

          # Zoom Controls
          "$1mod, mouse_down, exec, hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor | awk '/^float.*/ {print $2 * 1.1}')"
          "$1mod, mouse_up, exec, hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor | awk '/^float.*/ {print $2 * 0.9}')"

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
        ];

        windowrule = [ "stayfocused,class:^(com.oracle.javafx.scenebuilder.app.SceneBuilderApp)$" ];

        layerrule = [
          "noanim, hyprpicker"
          "noanim, selection "
        ];
      };
    };
  };
}
