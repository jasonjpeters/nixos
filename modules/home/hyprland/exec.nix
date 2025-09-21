{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user start hyprpolkitagent"

      "killall -q waybar;sleep .5 && waybar"
      "nm-applet --indicator"
    ];
  };
}
