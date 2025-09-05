{ setup, ... }:
{
  home-manager.users.${setup.user} = {
    programs.vesktop = {
      enable = true;
      settings = {
        arRPC = true;
        disableSmoothScroll = false;
        hardwareAcceleration = true;
        appBadge = true;
        splashTheming = true;
        staticTitle = true;
        discordBranch = "stable";
        spellCheckLanguages = [
          "de"
          "en"
        ];
      };
      vencord.settings = {
        autoUpdate = true;
        autoUpdateNotification = false;
        plugins = {
          FakeNitro.enabled = true;
          ClearURLs.enabled = true;
          CrashHandler.enabled = true;
          FixCodeblockGap.enabled = true;
          FixSpotifyEmbeds.enabled = true;
          FixImageQuality.enabled = true;
          FixYoutubeEmbeds.enabled = true;
          SpotifyCrack.enabled = true;
          YoutubeAdblock.enabled = true;
          DisableCallIdle.enabled = true;
        };
      };
    };
  };
}
