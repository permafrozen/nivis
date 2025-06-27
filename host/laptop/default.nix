{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../module
    ../../system
  ];

  nivis = {
    hyprland = {
      enable = true;
      enableUWSM = true;
    };
    locale = {
      enable = true;
      locale = "en_US.UTF-8";
      extra = "de_AT.UTF-8";
      timeZone = "Europe/Vienna";
    };
    keyboard = {
      enable = true;
      layout = "de";
    };
  };
}
