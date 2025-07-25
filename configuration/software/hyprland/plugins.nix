{ setup, inputs, ... }:
{
  home-manager.users.${setup.user} = {
    wayland.windowManager.hyprland = {

      # Hyprland Plugins from the flake inputs
      plugins = [ inputs.hypr-dynamic-cursors.packages.${setup.system}.hypr-dynamic-cursors ];

      # Hyprland Plugin settings
      settings = {
        plugin = {
          dynamic-cursors = {
            enabled = true;
          };
        };
      };
    };
  };
}
