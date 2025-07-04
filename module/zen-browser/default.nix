{
  config,
  lib,
  pkgs,
  inputs,
  setup,
  ...
}:
let
  cfg = config.nivis.zen-browser;
  inherit (lib.options) mkEnableOption;
  inherit (lib.modules) mkIf;
in
{
  options.nivis.zen-browser = {
    enable = mkEnableOption "Enable the Zen Browser";
  };
  config = mkIf cfg.enable {
    home-manager.users.${setup.user} = {
      imports = [ inputs.zen-browser.homeModules.beta ];
      programs.zen-browser = {
        enable = true;

        policies = {
          DisableAppUpdate = true;
          DisablePocket = true;
          DisableMasterPasswordCreation = true;
          DisableFirefoxStudies = true;
          DisableFirefoxAccounts = true;
          DisableTelemetry = true;
          DisableProfileImport = true;
          DisableSetDesktopBackground = true;
          DisplayBookmarksToolbar = "never";
          OfferToSaveLogins = false;
        };

        profiles."default" = {
          name = "${setup.user}";
          id = 0;
          isDefault = true;

          extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
            privacy-badger
            sponsorblock
            ublock-origin
            bitwarden
            wikiwand-wikipedia-modernized
            youtube-shorts-block
            search-by-image
            return-youtube-dislikes
          ];

          settings = {
            "extensions.autoDisableScopes" = 0;
            "browser.aboutConfig.showWarning" = false;
            "devtools.debugger.remote-enabled" = true;
            "devtools.chrome.enabled" = true;
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            "browser.tabs.allow_transparent_browser" = true;
            "zen.widget.linux.transparency" = false;
            "gfx.webrender.all" = true;
            "zen.view.grey-out-inactive-windows" = false;
            "signon.rememberSignons" = false;
            "browser.translations.automaticallyPopup" = false;
            "zen.workspaces.force-container-workspace" = true;
            "browser.download.lastDir" = "/home/matteo/downloads";
            "zen.welcome-screen.seen" = true;
          };

          search.engines = {
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];

              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };

            "NixOS Wiki" = {
              urls = [ { template = "https://wiki.nixos.org/index.php?search={searchTerms}"; } ];
              icon = "https://wiki.nixos.org/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@nw" ];
            };

            "Perplexity" = {
              urls = [ { template = "https://www.perplexity.ai/search/?q={searchTerms}"; } ];
              icon = "https://www.perplexity.ai/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@pp" ];
            };

            "MyNixOS" = {
              urls = [ { template = "https://mynixos.com/search?q={searchTerms}"; } ];
              icon = "https://mynixos.com/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@my" ];
            };

            "GitHub" = {
              urls = [ { template = "https://github.com/search?q={searchTerms}&type=repositories"; } ];
              icon = "https://github.com/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@gh" ];
            };

            "youtube" = {
              urls = [ { template = "https://www.youtube.com/results?search_query={searchTerms}"; } ];
              icon = "https://www.youtube.com/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@yt" ];
            };

            "bing".metaData.hidden = true;
            "google".metaData.alias = "@go"; # builtin engines only support specifying one additional alias
            "ddg".metaData.alias = "@ddg"; # ^
          };
          userContent = mkIf config.nivis.stylix.enable (import ./userContent.nix { inherit config; }).css;
          userChrome = mkIf config.nivis.stylix.enable (import ./userChrome.nix { inherit config; }).css;
        };
      };
    };
  };
}
