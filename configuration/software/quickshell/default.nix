{ inputs, setup, ... }:
{
  environment.systemPackages = [ inputs.schnell.packages.${setup.system}.default ];
}
