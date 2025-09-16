{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # db
    jetbrains.datagrip

    # c*
    jetbrains.clion

    # android
    androidStudioPackages.canary

    # java
    jetbrains.idea-ultimate
    scenebuilder

    # python
    jetbrains.pycharm-professional
    conda
  ];
  environment.variables = {
    GSETTINGS_SCHEMA_DIR = "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}/glib-2.0/schemas";
  };

  programs.java = {
    enable = true;
    package = (pkgs.jdk21.override { enableJavaFX = true; });
  };
}
