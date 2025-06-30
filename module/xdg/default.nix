{
  config,
  lib,
  setup,
  ...
}:
let
  cfg = config.nivis.xdg;
in
{
  options.nivis.xdg = {
    enable = lib.mkEnableOption "Enable custom xdg user directories";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${setup.user} = {
      xdg.userDirs = {
        enable = true;
        createDirectories = true;
        desktop = "$HOME/desktop";
        documents = "$HOME/documents";
        download = "$HOME/downloads";
        videos = "$HOME/videos";
        templates = "$HOME/templates";
        music = "$HOME/music";
        pictures = "$HOME/pictures";
        publicShare = "$HOME/public";
        extraConfig = {
          XDG_DEV_DIR = "$HOME/dev";
          XDG_VIRT_DIR = "$HOME/virt";
        };
      };
    };
  };
}
