{
  config,
  lib,
  pkgs,
  setup,
  inputs,
  ...
}:
let
  cfg = config.nivis.fish;
in

{
  options.nivis.fish = {
    enable = lib.mkEnableOption "Enables the fish shell with a few utilities";
    defaultShell = lib.mkEnableOption "Set fish as the default Shell instead of bash";
  };

  config = lib.mkIf cfg.enable {

    environment.systemPackages = with pkgs; [
      eza
      nh
      yt-dlp
      fastfetch
    ];

    # Set fish as Default Shell
    programs.bash = lib.mkIf cfg.defaultShell {
      interactiveShellInit = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '';
    };

    # Fish Settings
    home-manager.users.${setup.user} = {
      programs = {
        fish = {
          enable = true;
          functions = {
            # __fish_command_not_found_handler = {
            #   body = "__fish_default_command_not_found_handler $argv[1]";
            #   onEvent = "fish_command_not_found";
            # };
          };
          shellAliases = {
            ls = "eza";
            cd = "z";
            nos = "rm -f ~/.zen/default/search.json.mozlz4.backup && nh os switch .";
            ytd = "yt-dlp -f bestaudio --extract-audio --audio-format mp3";
            ff = "clear && fastfetch && sleep 1d";
          };
          shellInit = ''
            fish_default_key_bindings
            set -U fish_greeting
            direnv hook fish | source
          '';
        };

        # Shell Utilities
        zoxide = {
          enable = true;
          enableFishIntegration = true;
        };
        fzf = {
          enable = true;
          enableFishIntegration = true;
        };
        yazi = {
          enable = true;
          enableFishIntegration = true;
        };
        direnv = {
          enable = true;
          silent = true;
        };
        nix-index = {
          enable = true;
          enableFishIntegration = true;
        };
      };

      # Database for nix-index command-not-found
      home.file."nix-index" = {
        target = ".cache/nix-index/files";
        source = inputs.nix-index-database.packages.${setup.system}.nix-index-database;
      };
    };
  };
}
