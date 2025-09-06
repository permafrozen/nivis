{
  config,
  pkgs,
  setup,
  ...
}:
{
  # themes from: https://tinted-theming.github.io/tinted-gallery/
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";
    override.base01 = "202020"; # TODO: Extract Color From .yaml Theme

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
