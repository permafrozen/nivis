{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    jetbrains.clion
    jetbrains.idea-ultimate
    jetbrains.datagrip
    scenebuilder
  ];

  programs.java = {
    enable = true;
    package = (pkgs.jdk21.override { enableJavaFX = true; });
  };
}
