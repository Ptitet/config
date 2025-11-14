{ config, lib, ... }:
let
  cfg = config.my.services.mako;
in
{
  options.my.services.mako.enable = lib.mkEnableOption "Enables Mako notifications daemon";

  config = lib.mkIf cfg.enable {
    services.mako = {
      enable = true;
    };
  };
}
