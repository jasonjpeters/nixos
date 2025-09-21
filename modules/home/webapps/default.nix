{ config, lib, pkgs, ... }:

let
  inherit (lib) mkIf mkMerge hasSuffix replaceStrings toLower optionalAttrs;

  chromium = "${pkgs.chromium}/bin/chromium";
  mkId = s: toLower (replaceStrings [ " " "/" ":" ] [ "-" "-" "-" ] s);

  # Where per-app definitions live
  appsDir = ./apps;
  appsDirExists = builtins.pathExists appsDir;
  files   = if appsDirExists then builtins.attrNames (builtins.readDir appsDir) else [];
  appFiles = builtins.filter (f: hasSuffix ".nix" f && f != "default.nix") files;

  # Import each ./apps/<app>.nix → attrset like { name; url; ... }
  apps = if appsDirExists then map (f: import (appsDir + "/${f}")) appFiles else [];

  # Build a single-line Exec command (no env var expansion here)
  mkExec = app:
    let
      id      = mkId (app.id or app.name);
      wmClass = "WebApp-${id}";
      profile = "${config.home.homeDirectory}/.local/share/webapps/${id}";
    in
    "${chromium} --ozone-platform=wayland --no-first-run --new-window --class=${wmClass} --name=${wmClass} --user-data-dir=${profile} --app=${app.url}";

  # Optional filters so blank values are ignored
  hasBind = a: a ? hypr && a.hypr ? bind && a.hypr.bind != null && a.hypr.bind != "";
  hasWs   = a: a ? hypr && a.hypr ? workspace && a.hypr.workspace != null && a.hypr.workspace != "";

in
{
  xdg.enable = true;

  # Install icons if provided in each app
  home.file = mkMerge (map (a:
    let id = mkId (a.id or a.name);
    in optionalAttrs (a ? icon) {
      ".local/share/icons/webapps/${id}.png".source = a.icon;
    }
  ) apps);

  # Create .desktop entries for each app
  xdg.desktopEntries = builtins.listToAttrs (map (a:
    let
      id      = mkId (a.id or a.name);
      wmClass = "WebApp-${id}";
      exec    = mkExec a;
      iconAbs =
        if (a ? icon)
        then "${config.home.homeDirectory}/.local/share/icons/webapps/${id}.png"
        else null;
    in {
      name = id;
      value = {
        name        = a.name;
        genericName = "Web App";
        comment     = a.comment or "Site-specific browser window for ${a.name}";
        exec        = exec;           # single line, valid Exec
        terminal    = false;
        type        = "Application";
        categories  = a.categories or [ "Network" ];
        settings.StartupWMClass = wmClass;
      } // (optionalAttrs (iconAbs != null) { icon = iconAbs; });
    }
  ) apps);

  # Hyprland keybinds and workspace rules (only if Hyprland is enabled via HM)
  wayland.windowManager.hyprland = mkIf (config.wayland.windowManager.hyprland.enable or false) {
    settings = {
      bind =
        (config.wayland.windowManager.hyprland.settings.bind or [])
        ++ map (a: "${a.hypr.bind}, exec, ${mkExec a}") (builtins.filter hasBind apps);

      windowrulev2 =
        (config.wayland.windowManager.hyprland.settings.windowrulev2 or [])
        ++ map (a:
          let cls = "WebApp-${mkId (a.id or a.name)}";
          in "workspace ${a.hypr.workspace}, class:^${cls}$"
        ) (builtins.filter hasWs apps);
    };
  };
}
