{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.nivis.steam;
  inherit (lib.modules) mkIf;
  inherit (lib.options) mkEnableOption;
in
{
  options.nivis.steam = {
    enable = mkEnableOption "Enable Steam Module";
  };
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      mangohud
      gamemode
    ];
    programs.steam = {
      enable = true;
      extraCompatPackages = with pkgs; [ proton-ge-bin ];
    };
  };
}
