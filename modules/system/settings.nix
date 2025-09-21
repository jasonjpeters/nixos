{ env, ... }:
{
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    download-buffer-size = 200000000;
    auto-optimise-store = true;
    allowed-users = [ "${env.username}" ];
  };
}
