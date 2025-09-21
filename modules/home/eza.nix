{ ... }:
{
  programs.eza = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    icons = "auto";
    git = true;

    extraOptions = [
      "--group-directories-first"
      "--no-quotes"
      "--header"
      "--git-ignore"
      "--icons=always"
      "--time-style=long-iso"
      "--classify"
      "--hyperlink"
    ];
  };

  home.shellAliases = {
    ls = "eza -lA";
    lt = "eza --tree --level=2";
    ll = "eza  -lh --no-user --long";
    la = "eza -lah ";
    tree = "eza --tree ";
  };
}
