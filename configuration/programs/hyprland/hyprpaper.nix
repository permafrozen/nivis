{ setup, ... }:
{
  home-manager.users.${setup.user} = {
    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = false;
        splash_offset = 2.0;
        preload = [ "${../../assets/alps.png}" ];
        wallpaper = [ ",${../../assets/alps.png}" ];
      };
    };
  };
}
