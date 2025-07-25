{ setup, inputs, ... }:
{

  nix.settings = {
    builders-use-substitutes = true;
    extra-substituters = [ "https://anyrun.cachix.org" ];
    extra-trusted-public-keys = [ "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s=" ];
  };

  home-manager.users.${setup.user} = {
    programs.anyrun = {
      enable = true;
      config = {
        plugins = with inputs.anyrun.packages.${setup.system}; [
          applications
          dictionary
          translate
          rink
        ];
        hideIcons = false;
        hidePluginInfo = true;
      };

      extraCss = ''
        window {
          background: transparent !important;
        }
      '';

      extraConfigFiles = {
        "applications.ron".text = ''
          Config(
            desktop_actions: true,
            max_entries: 10,
            terminal: Some("kitty"),
          )
        '';
      };
    };

    # All launched Application are wrapped by app2unit therefore launched
    # as systemd units when hyprland is enabled.
    home.file.anyrun = {
      target = ".local/share/anyrun/preprocess_application_command.sh";
      text = "app2unit -s a \"@\"";
    };
  };
}
