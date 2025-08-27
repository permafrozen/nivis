{ inputs, setup, ... }:
{
  environment.systemPackages = [ inputs.shell.packages.${setup.system}.default ];
}
