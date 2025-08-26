{ lib, config, ... }:
let
  cfg = config.my.services.wpaperd;
in
{
  options.my.services.wpaperd.enable = lib.mkEnableOption "Enables wpaperd";

  config = lib.mkIf cfg.enable {
    services.wpaperd = {
      enable = true;
      settings =
        let
          path = "/home/jules/wallpapers";
        in
        {
          eDP-1 = {
            inherit path;
            duration = "1min";
            mode = "center";
            group = 0;
          };
          HDMI-A-1 = {
            group = 0;
          };
        };
    };
  };
}
