{
  inputs,
  config,
  setup,
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
        nixvim-stylix = nixvim-config.extend config.lib.stylix.nixvim.config;
      in
      [ nixvim-stylix ];
  };

  # programs.nixvim = {
  #   enable = true;
  #   clipboard.providers.wl-copy.enable = true;

  #   globalOpts = {
  #     encoding = "utf-8";
  #     fileencoding = "utf-8";
  #   };

  #   plugins = {
  #     lsp = {
  #       enable = true;
  #       inlayHints = true;
  #       servers = {

  #         # UTF-8 Encoding must be set, or the language server will crash! (nixd issue)
  #         nixd = {
  #           enable = true;
  #         };
  #       };
  #     };
  #   };
  # };
}
