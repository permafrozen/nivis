{
  config,
  lib,
  setup,
  inputs,
  ...
}:
let
  cfg = config.nivis.anyrun;
  inherit (lib.options) mkEnableOption;
  inherit (lib.modules) mkIf;
in
{
  options.nivis.anyrun = {
    enable = mkEnableOption "Whether the anyrun module should be enable or not.";
  };

  config = mkIf cfg.enable {
    nix.settings = {
      builders-use-substitutes = true;
      extra-substituters = [
        "https://anyrun.cachix.org"
      ];

      extra-trusted-public-keys = [
        "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
      ];
    };

    home-manager.users.${setup.user} = {
      programs.anyrun = {
        enable = true;
        config = {
          plugins = with inputs.anyrun.packages.${setup.system}; [
            applications
            dictionary
            translate
            websearch
            rink
            # kidex
            # randr
            # shell
            # stdin
            # symbols
          ];

          hideIcons = false;
          hidePluginInfo = true;
        };

        extraCss = ''
          window {
            background: transparent !important;
          }
        '';

        extraConfigFiles =
          let
            terminal =
              if config.nivis.kitty.enable then
                "kitty"
              else if config.nivis.foot.enable then
                "foot"
              else if config.nivis.contour.enable then
                "contour"
              else
                "";
          in
          {
            "applications.ron".text = ''
              Config(
                desktop_actions: true,
                max_entries: 10,
                terminal: Some("${terminal}"),
              )
            '';
          };
      };

      # All launched Application are wrapped by app2unit therefore launched
      # as systemd units when hyprland is enabled.
      home.file.anyrun = mkIf config.nivis.hyprland.enable {
        target = ".local/share/anyrun/preprocess_application_command.sh";
        text = "app2unit -s a \"@\"";
      };
    };
  };
}
