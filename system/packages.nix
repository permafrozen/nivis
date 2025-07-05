{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bat
    btop
    git
    github-cli
    lazygit
    lazydocker
    ripgrep
  ];
}
