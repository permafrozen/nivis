{ config, setup, ... }:
{
  home-manager.users.${setup.user} = {
    programs.kitty = {
      enable = true;
      settings = {
        # Main Settins
        "confirm_os_window_close" = 0;
        "enable_audio_bell" = false;
        "allow_remote_control" = true;

        # Cursor Settings
        "cursor_trail" = 1;
        "cursor_shape" = "block";
        "cursor_shape_unfocused" = "hollow";

        # Font Settings
        "disable_ligatures" = "never";
        "font_family" = ''family="${config.stylix.fonts.monospace.name}"'';
        "font_size" = 14;
        "bold_font" = "auto";
        "bold_italic_font" = "auto";
        "italic_font" = "auto";
      };
    };
  };
}
