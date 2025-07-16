{ config, lib, ... }:
{
  imports = [
    ../services
  ];
  options = {
    graphical.enable = lib.mkEnableOption "Enables the graphical session";
  };
  config = lib.mkIf config.graphical.enable {
    services.displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    hyprland.enable = true;
  };
}
