{
  inputs,
  pkgs,
  setup,
  ...
}:
{
  home-manager.users.${setup.user} = {
    programs.ghostty = {
      enable = true;
      package = inputs.ghostty.packages.${pkgs.system}.default;
      settings = {
        resize-overlay = "never";
        window-inherit-working-directory = false;
        custom-shader = "${./cursor-smear.glsl}";
      };
    };
  };
}
