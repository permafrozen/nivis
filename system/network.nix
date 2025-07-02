{ setup, ... }:
{
  networking = {
    hostName = "${setup.host}";
    networkmanager.enable = true;
    # nameservers = [
    #   "1.1.1.1"
    #   "1.0.0.1"
    # ];
  };
  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        Experimental = true;
      };
    };
  };
}
