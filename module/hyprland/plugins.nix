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
        ];

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
  };
}
