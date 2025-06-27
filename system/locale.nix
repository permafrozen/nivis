{ config, lib, ... }:
let
  cfg = config.nivis.locale;
in
{

  options.nivis.locale = {
    enable = lib.mkEnableOption "enable custom locales";

    locale = lib.mkOption {
      type = lib.types.str;
      default = "en_US.UTF-8";
    };

    extra = lib.mkOption {
      type = lib.types.str;
      default = "en_US.UTF-8";
    };

    timeZone = lib.mkOption {
      type = lib.types.str;
      default = "Europe/Vienna";
    };
  };

  config = lib.mkIf cfg.enable {
    time.timeZone = cfg.timeZone;
    i18n = {
      defaultLocale = cfg.locale;
      extraLocaleSettings = {
        LC_ADDRESS = cfg.extra;
        LC_IDENTIFICATION = cfg.extra;
        LC_MEASUREMENT = cfg.extra;
        LC_MONETARY = cfg.extra;
        LC_NAME = cfg.extra;
        LC_NUMERIC = cfg.extra;
        LC_PAPER = cfg.extra;
        LC_TELEPHONE = cfg.extra;
        LC_TIME = cfg.extra;
      };
    };
  };
}
