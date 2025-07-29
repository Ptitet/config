{ config, lib, ... }:
{
  options.my.apps.TEMPLATE.enable = lib.mkEnableOption "Enables TEMPLATE";

  config = lib.mkIf config.my.apps.TEMPLATE.enable {

  };
}
