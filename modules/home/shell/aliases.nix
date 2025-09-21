{ env, ... }:
{
  ".." = "cd ..";

  cat = "bat";

  nos = "nh os switch --hostname ${env.host}";
  nosu = "nh os switch --hostname ${env.host} --update";

  ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
}
