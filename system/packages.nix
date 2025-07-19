{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bat
    zip
    unzip
    btop
    yazi
    git
    github-cli
    lazygit
    lazydocker
    ripgrep
  ];
}
