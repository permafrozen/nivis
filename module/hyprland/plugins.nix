{
  cfg,
  lib,
  setup,
  inputs,
  ...
}:
let
  inherit (lib.modules) mkIf;
  inherit (lib.options) mkEnableOption;
in
{
  options.nivis.hyprland.plugins = {
    enable = mkEnableOption "Enable hyprland plugins and configuration for them";
  };
  config = mkIf cfg.plugins.enable {
    home-manager.users.${setup.user} = {
      wayland.windowManager.hyprland = {

        # Hyprland Plugins from the flake inputs
        plugins = [
          inputs.hypr-dynamic-cursors.packages.${setup.system}.hypr-dynamic-cursors
          # inputs.hyprland-plugins.packages.${setup.system}.csgo-vulkan-fix
        ];

        # Hyprland Plugin settings
        settings = {
          plugin = {

            # Cursor Animations
            dynamic-cursors = {
              enabled = true;
            };

            # Vulcan Resolution Fix for Games
            # csgo-vulkan-fix = {
            #   res_w = 1280;
            #   res_h = 720;
            #   class = "cs2";
            #   fix_mouse = true;
            # };
          };
        };
      };
    };
  };
}
