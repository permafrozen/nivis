{
  config,
  lib,
  pkgs,
  setup,
  ...
}:
{
  # themes from: https://tinted-theming.github.io/tinted-gallery/
  stylix =
    let
      themePath = "${pkgs.base16-schemes}/share/themes/moonlight.yaml";
    in
    {
      enable = true;
      base16Scheme = themePath;
      override.base01 = (config.stylix.base16.mkSchemeAttrs themePath).base00;

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
          package = pkgs.nerd-fonts.symbols-only;
          name = "Symbols Nerd Font";
        };
      };
      cursor = {
        name = "rose-pine-hyprcursor";
        package = pkgs.rose-pine-hyprcursor;
        size = 24;
      };
    };

  home-manager.users.${setup.user}.stylix.targets = {
    zen-browser.profileNames = [ "default" ];
  };
}
