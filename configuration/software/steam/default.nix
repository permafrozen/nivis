{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    mangohud
    gamemode
  ];
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
  };
}
