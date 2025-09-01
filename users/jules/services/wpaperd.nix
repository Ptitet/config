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
          random-cfg = group: {
            inherit path group;
            duration = "1min";
            mode = "center";
          };
        in
        {
          eDP-1 = random-cfg 0;
          HDMI-A-1 = random-cfg 0;
        };
    };
  };
}
