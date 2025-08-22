{ pkgs, lib, ... }:
{
  boot = {
    plymouth = {
      enable = true;
      theme = lib.mkForce "hexagon_2";
      themePackages = lib.mkForce [
        (pkgs.adi1090x-plymouth-themes.override { selected_themes = [ "hexagon_2" ]; })
      ];
    };
    consoleLogLevel = 3;
    initrd.verbose = false;
    loader.timeout = 0;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
  };
}
