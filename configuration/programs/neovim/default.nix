{ ... }:
{
  environment.sessionVariables = {
    MANPAGER = "nvim +Man!";
    EDITOR = "nvim";
  };

  programs.nixvim = {
    enable = true;
    clipboard.providers.wl-copy.enable = true;

    plugins = {
      lsp = {
        enable = true;
        servers = {
          nixd = {
            enable = true;
            extraOptions = {
              offset_encoding = "utf-8";
            };
          };
        };
      };
    };
  };
}
