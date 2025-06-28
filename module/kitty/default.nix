{
  config,
  lib,
  setup,
  ...
}:
let
  cfg = config.nivis.kitty;
in
{
  options.nivis.kitty = {
    enable = lib.mkEnableOption "Enables the kitty terminal emulator";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${setup.user} = {
      programs.kitty = {
        enable = true;
        settings = {
          "confirm_os_window_close" = 0;
          "cursor_trail" = 1;
          "disable_ligatures" = "never";
          "font_family" = "family=\"Dank Mono\"";
          "font_size" = 14;
          "bold_font" = "auto";
          "bold_italic_font" = "auto";
          "italic_font" = "auto";
        };
      };
    };
  };
}
