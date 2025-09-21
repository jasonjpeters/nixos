{ lib, env, ... }:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];

  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
  services.spice-webdavd.enable = true;

  environment.etc."fstab".text = lib.mkAfter ''
    nixos0 /home/${env.username}/nixos virtiofs defaults 0 0
  '';
}
