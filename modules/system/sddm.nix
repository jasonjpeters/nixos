{ pkgs, ... }:
let
  sddm-astronaut = pkgs.sddm-astronaut.override {
    themeConfig = {
        FormPosition = "left";
        Blur = "4.0";
    };
  };

in {
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      package = pkgs.kdePackages.sddm;
      extraPackages = with pkgs; [ sddm-astronaut ];
      theme = "sddm-astronaut-theme";
    };
  };

  environment.systemPackages = with pkgs; [ sddm-astronaut ];
}
