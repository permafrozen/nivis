{ ... }:
{
  # System Settings
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05"; # be careful with this one
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
