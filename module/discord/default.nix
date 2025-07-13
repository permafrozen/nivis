{
  config,
  lib,
  setup,
  ...
}:
{
  home-manager.users.${setup.user} = {
    programs.vesktop.enable = true;
  };
}
