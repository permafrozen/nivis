{
  pkgs,
  lib,
  setup,
  inputs,
  ...
}:
{

  qt.enable = true;

  environment.systemPackages = with pkgs; [
    codebook
    nixd
    nixfmt-rfc-style
    marksman
    prettier
  ];

  home-manager.users.${setup.user} = {
    programs.helix = {
      enable = true;
      defaultEditor = true;
      settings = {
        editor = {
          soft-wrap.enable = true;
          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "block";
          };
        };
      };
      languages = {
        language = [
          {
            name = "nix";
            auto-format = true;
            language-servers = [ "nixd" ];
            formatter = {
              command = lib.getExe pkgs.nixfmt-rfc-style;
              args = [ "--strict" ];
            };
          }
          {
            name = "qml";
            auto-format = true;
            language-servers = [ "qmlls" ];
          }
          {
            name = "markdown";
            formatter = {
              command = "prettier";
            };
            language-servers = [
              "marksman"
              "codebook"
            ];
          }
        ];
        language-server = {
          codebook = {
            command = "codebook-lsp";
            args = [ "serve" ];
          };
          nixd = {
            command = "nixd";
            args = [ "--inlay-hints" ];
            config.nixd = {
              # Nixpkgs used actually from this flake
              nixpkgs.expr = ''(builtins.getFlake "${inputs.self}").inputs.nixpkgs { }'';

              # Completion for nixos/hm Modules
              options = {
                nixos.expr = ''(builtins.getFlake "${inputs.self}").nixosConfigurations."${setup.host}".options'';
                home-manager.expr = ''(builtins.getFlake "${inputs.self}").nixosConfigurations."${setup.host}".options.home-manager.users.type.getSubOptions []'';
              };
            };
            qmlls = {
              args = [ "-E" ];
              command = "qmlls";
            };
          };
        };
      };
    };
  };
}
