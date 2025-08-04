{ lib, config, ... }:
let
  cfg = config.my.services.wpaperd;
in
{
  options.my.services.wpaperd.enable = lib.mkEnableOption "Enables wpaperd";

  config = lib.mkIf cfg.enable {
    services.wpaperd = {
      enable = true;
      settings = {
        eDP-1 = {
          path = "/home/jules/wallpapers";
          duration = "1min";
          mode = "center";
          group = 0;
        };
      };
    };
  };
}
