{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../module
    ../../system
  ];

  nivis = {
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
    fish = {
      enable = true;
      defaultShell = true;
    };
    hyprland = {
      enable = true;
      hyprpaper.enable = true;
      plugins.enable = true;
      monitors = [
        "eDP-1, 1920x1080@60, 0x0, 1"
        "HDMI-A-1, 1920x1080@60, 0x-1080, 1"
        # "HDMI-A-1, 1920x1080@60, auto, 1, mirror, eDP-1"
      ];
    };
    steam.enable = true;
    stylix.enable = true;
    anyrun.enable = true;
    zen-browser.enable = true;
    helix.enable = true;
    kitty.enable = true;
    kanata.enable = true;
    xdg.enable = true;
    xanmod.enable = true;
    prismlauncher.enable = true;
    quickemu.enable = true;
    schnell.enable = true;
  };
}
