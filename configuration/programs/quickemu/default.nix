{ pkgs, setup, ... }:
{
  environment.systemPackages = with pkgs; [
    quickemu
    spice-gtk
  ];
  services.samba.enable = true;

  # Enable virt-manager and dconf
  programs.virt-manager.enable = true;
  programs.dconf.enable = true;

  # Enable libvirtd
  virtualisation.libvirtd = {
    enable = true;
    allowedBridges = [ "br0" ];
  };

  virtualisation.virtualbox.host.enable = true;

  # Ensure user is added to the libvirtd group
  users.users.${setup.user}.extraGroups = [ "libvirtd" ];

  # Kernel module and virtualization settings specific to AMD
  boot.kernelModules = [
    "kvm"
    "kvm-amd"
  ];
  boot.kernelParams = [
    "amd_iommu=on"
    "iommu=pt"
  ];
}
