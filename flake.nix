{
  description = "NixOS FS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:nix-community/stylix/release-25.05";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";

    env =
      if builtins.pathExists ./env.nix
      then import ./env.nix
      else throw "Missing ./env.nix";

    mkNixosConfig = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit inputs;
        inherit env;
      };

      modules = [
        ./hosts/${env.host}
        ./modules/drivers
        ./modules/system
        ./modules/home
      ];
    };

  in {
    nixosConfigurations.${env.host} = mkNixosConfig;
  };
}
