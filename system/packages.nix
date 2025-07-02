{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    lazygit
    lazydocker
    ripgrep
  ];
}
