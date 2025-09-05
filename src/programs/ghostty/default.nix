{ setup, ... }:
{
  home-manager.users.${setup.user} = {
    programs.ghostty = {
      enable = true;
      settings = {
        resize-overlay = "never";
        custom-shader = "${./cursor-smear.glsl}";
      };
    };
  };
}
