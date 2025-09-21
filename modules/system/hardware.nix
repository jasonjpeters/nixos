{ pkgs, ... }:
{
  hardware = {
    graphics.enable = true;
    keyboard.qmk.enable = true;
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
  };
}
