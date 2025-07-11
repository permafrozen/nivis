{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nivis.prismlauncher;
  inherit (lib.modules) mkIf;
  inherit (lib.options) mkEnableOption;
in
{
  options.nivis.prismlauncher = {
    enable = mkEnableOption "Enable the prism launcher including jdks";
  };
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      (prismlauncher.override {
        # Add binary required by some mod
        additionalPrograms = [ ffmpeg ];

        # Change Java runtimes available to Prism Launcher
        jdks = [
          graalvm-ce
          zulu8
          zulu17
          zulu
        ];
      })
    ];
  };
}
