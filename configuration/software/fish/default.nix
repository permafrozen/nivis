{
  pkgs,
  setup,
  inputs,
  ...
}:
{
  # Set fish as Default Shell
  programs.bash = {
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
        shellAliases = {
          ls = "eza --group-directories-last";
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
        functions = {
          rsl = ''
            if test (count $argv) -ne 1
              echo "Error: exactly one argument required" >&2
              return 1
            end

            cp --remove-destination "$(readlink -f $argv)" $argv

            if test $status -eq 0
              chmod +w $argv
            end
          '';
        };
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
        nix-direnv.enable = true;
      };
      btop = {
        enable = true;
        settings = import ./btop.nix;
      };
      nix-index = {
        enable = true;
        enableFishIntegration = true;
      };
      starship = {
        enable = true;
        enableFishIntegration = true;
        settings = import ./starship.nix;
      };
    };

    # Database for nix-index command-not-found
    home.file."nix-index" = {
      target = ".cache/nix-index/files";
      source = inputs.nix-index-database.packages.${setup.system}.nix-index-database;
    };
  };
}
