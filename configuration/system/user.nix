{ setup, ... }:
{
  # Define a user account
  users = {
    users.${setup.user} = {
      isNormalUser = true;
      description = "${setup.user}";
      initialPassword = "nixos";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };
}
