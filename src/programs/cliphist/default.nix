{ pkgs, setup, ... }:
{
  environment.systemPackages = with pkgs; [ wl-clipboard ];
  home-manager.users.${setup.user} = {
    services.cliphist = {
      enable = true;
      allowImages = true;
    };
  };
}
