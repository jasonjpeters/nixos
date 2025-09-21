{ inputs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  imports = [
    inputs.stylix.nixosModules.stylix

    ./boot.nix
    ./fonts.nix
    ./hardware.nix
    ./hyprland.nix
    ./locale.nix
    ./network.nix
    ./nh.nix
    ./packages.nix
    ./sddm.nix
    ./services.nix
    ./settings.nix
    ./stylix.nix
  ];
}
