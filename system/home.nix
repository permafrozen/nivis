{ setup, lib, ... }:

{
  home-manager = {
    # extraSpecialArgs = specialArgs;
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    users.${setup.user} = {
      home = {
        username = "${setup.user}";
        homeDirectory = lib.mkDefault "/home/${setup.user}";
        stateVersion = "24.05"; # careful, like nixos version
      };

      # Let Home Manager install and manage itself.
      programs.home-manager.enable = true;
    };
  };
}
