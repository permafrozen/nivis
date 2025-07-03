{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nivis.stylix;
  inherit (lib.options) mkEnableOption;
  inherit (lib.modules) mkIf;
in
{
  options.nivis.stylix = {
    enable = mkEnableOption "Enables stylix for color management";
  };

  config = mkIf cfg.enable {
    stylix = {
      enable = true;
      # themes from: https://tinted-theming.github.io/tinted-gallery/
      base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-pale.yaml";

      # fc-list | grep -i <name> to find out the name of the fonts after installing
      fonts = {
        serif = {
          package = pkgs.maple-mono.NF;
          name = "Maple Mono NF";
        };

        sansSerif = {
          package = pkgs.maple-mono.NF;
          name = "Maple Mono NF";
        };

        monospace = {
          package = pkgs.maple-mono.NF;
          name = "Maple Mono NF";
        };

        emoji = {
          package = pkgs.noto-fonts-emoji;
          name = "Noto Color Emoji";
        };
      };
      cursor = {
        name = "rose-pine-hyprcursor";
        package = pkgs.rose-pine-hyprcursor;
        size = 24;
      };
    };
  };
}
