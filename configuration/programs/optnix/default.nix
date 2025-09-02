{
  inputs,
  pkgs,
  options,
  ...
}:
let
  optnixLib = inputs.optnix.mkLib pkgs;
in
{
  programs.optnix = {
    enable = true;
    settings = {
      scopes = {
        nixos = {
          description = "nixos flake configuration options";
          options-list-file = optnixLib.mkOptionsList { inherit options; };
        };
        home-manager = {
          description = "home-manager options for all systems";
          options-list-file = optnixLib.hm.mkOptionsListFromHMSource {
            home-manager = inputs.home-manager;
            modules = with inputs; [ ];
          };
        };
      };
    };
  };
}
