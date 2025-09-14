{
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
        nixvim-config = inputs.neco.packages.${setup.system}.default;
        nixvim-stylix = nixvim-config.extend (
          config.lib.stylix.nixvim.config // { config = lib.mkForce config.lib.stylix.nixvim.config.config; }
        );
      in
      [
        # nixvim-stylix
      ];
  };
}
