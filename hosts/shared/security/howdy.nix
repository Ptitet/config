{ config, lib, ... }:
let
  cfg = config.my.security.howdy;
in
{
  options.my.security.howdy.enable = lib.mkEnableOption "Enables Howdy";

  config = lib.mkIf cfg.enable {
    services.howdy = {
      enable = true;
      control = "sufficient";
      settings.core.detection_notice = true;
    };

    services.linux-enable-ir-emitter = {
      enable = true;
    };

  };
}
