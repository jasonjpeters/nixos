{ pkgs, env, ... }:
{
  networking.hostName = "${env.hostname}";
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}
