{ ... }:
{
  environment.sessionVariables = {
    MANPAGER = "nvim +Man!";
    EDITOR = "nvim";
  };

  programs.nixvim = {
    enable = true;
  };
}
