{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
  };

  programs.hyprlock = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    hyprcursor
    hyprland-autoname-workspaces
    hyprland-monitor-attached
    hyprland-qtutils
    hyprlandPlugins.hy3
    hyprlandPlugins.xtra-dispatchers
    hyprls
    hyprpaper
    hyprpicker
    hyprpolkitagent
    hyprsome
    xdg-desktop-portal-hyprland
  ];
}
