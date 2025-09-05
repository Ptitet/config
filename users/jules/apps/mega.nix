{ config, lib, ... }:
let
  cfg = config.my.apps.mega;
in
{
  options.my.apps.mega.enable = lib.mkEnableOption "Enables Mega";

  config = lib.mkIf cfg.enable {
    services.megasync = {
      enable = true;
      forceWayland = true;
    };
  };
}
