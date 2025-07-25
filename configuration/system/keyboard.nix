{ ... }:
{
  # keyboard layout (xserver)
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  # keyboard layout (tty)
  console.keyMap = "de";
}
