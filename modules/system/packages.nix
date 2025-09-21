{ pkgs, ... }:
{
  programs.fish.enable = true;

  programs.firefox.enable = true;
  programs.chromium.enable = true;

  environment.systemPackages = with pkgs; [
    brightnessctl
    # btop
    cmatrix
    curl
    duf
    dysk
    ffmpeg
    ffmpegthumbnailer
    findutils
    git
    htop
    jq
    killall
    kitty
    openssl
    pciutils
    ripgrep
    rofi-wayland
    tree
    unzip
    vim
    wget
    xdg-user-dirs
    xdg-utils
    waybar
    zip
    chromium
  ];
}
