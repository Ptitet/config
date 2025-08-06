{ config, lib, ... }:
let
  cfg = config.my.apps.TEMPLATE;
in
{
  options.my.apps.TEMPLATE.enable = lib.mkEnableOption "Enables TEMPLATE";

  config = lib.mkIf cfg.enable {

  };
}
