{ setup, ... }:
{
  home-manager.users.${setup.user} = {
    programs.vesktop.enable = true;
  };
}
