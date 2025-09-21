{ pkgs, env, ... }:
{
  programs.fish = {
    enable = true;
    package = pkgs.fish;

    shellAliases = {
      nos = "nh os switch --hostname ${env.host}";
      nosu = "nh os switch --hostname ${env.host} --update";
      ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
    };
  };
}
