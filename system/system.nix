{ ... }:
{
  # System Settings
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05"; # be careful with this one
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Specification when using nixos-rebuild build-vm
  virtualisation.vmVariant = {
    virtualisation = {
      memorySize = 4096;
      cores = 2;
    };
  };
}
