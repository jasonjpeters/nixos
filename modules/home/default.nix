{ inputs, pkgs, env, ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  users.mutableUsers = true;
  users.users.${env.username} = {
    isNormalUser = true;
    description = "${env.fullname}";
    extraGroups = [
      "${env.username}"
      "users"
      "wheel"
      "video"
      "input"
      "networkManager"
      "docker"
      "libvirtd"
      "incus-admin"
    ];
    shell = pkgs.fish;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    extraSpecialArgs = {
      inherit inputs;
      inherit env;
    };

    users.${env.username} = {
      home.username = env.username;
      home.homeDirectory = "/home/${env.username}";
      home.stateVersion = "25.05";

      imports = [
        ./bat.nix
        ./btop.nix
        ./cava.nix
        ./eza.nix
        ./fastfetch
        ./fzf.nix
        ./git.nix
        ./gtk.nix
        ./htop.nix
        ./hyprland
        ./kitty.nix
        ./lazydocker.nix
        ./lazygit.nix
        ./qt.nix
        ./rofi.nix
        ./shell
        ./stylix.nix
        ./tmux.nix
        ./vscode.nix
        ./waybar.nix
        # ./webapps
        ./xdg.nix
        ./yazi
      ];
    };
  };
}
