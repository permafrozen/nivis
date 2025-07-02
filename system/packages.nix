{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bat
    btop
    git
    lazygit
    lazydocker
    ripgrep
  ];
}
