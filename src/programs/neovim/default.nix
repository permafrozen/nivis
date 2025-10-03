{
  pkgs,
  inputs,
  config,
  setup,
  lib,
  ...
}:
{
  environment = {
    sessionVariables = {
      MANPAGER = "nvim +Man!";
      EDITOR = "nvim";
    };

    systemPackages =
      let
        # Grab stylix override
        colors = pkgs.lib.filterAttrs (
          k: v: builtins.match "base0[0-9A-F]" k != null
        ) config.lib.stylix.colors.withHashtag;

        ren = inputs.ren.packages.${setup.system}.nvim;

        # Override provided flake package
        neovim = ren.override (prev: {
          packageDefinitions = prev.packageDefinitions // {
            nvim = ren.utils.mergeCatDefs prev.packageDefinitions.nvim (
              { pkgs, ... }:
              {
                extra = {
                  colorscheme = {
                    name = "stylix";
                    translucent = false;
                    base16 = colors;
                  };
                };
              }
            );
          };
        });
      in
      [ neovim ];
  };
}
