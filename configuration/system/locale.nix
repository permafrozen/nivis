{ setup, ... }:
{
  time.timeZone = setup.time;
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = setup.locale;
      LC_IDENTIFICATION = setup.locale;
      LC_MEASUREMENT = setup.locale;
      LC_MONETARY = setup.locale;
      LC_NAME = setup.locale;
      LC_NUMERIC = setup.locale;
      LC_PAPER = setup.locale;
      LC_TELEPHONE = setup.locale;
      LC_TIME = setup.locale;
    };
  };
}
