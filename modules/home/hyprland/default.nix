{ env, ... }:
{
  imports = [
    ./animation.nix
    ./bind.nix
    ./env.nix
    ./exec.nix
    ./hyprland.nix
    ./windowrule.nix
  ];
}
