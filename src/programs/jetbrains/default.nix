{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    jetbrains.clion
    jetbrains.idea-ultimate
    jetbrains.datagrip
    jetbrains.pycharm-professional
    androidStudioPackages.canary
    scenebuilder
  ];
  environment.variables = {
    GSETTINGS_SCHEMA_DIR = "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}/glib-2.0/schemas";
  };

  programs.java = {
    enable = true;
    package = (pkgs.jdk21.override { enableJavaFX = true; });
  };
}
