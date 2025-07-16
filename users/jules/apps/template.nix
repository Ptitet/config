{ config, lib, ... }:
{
  options.apps.TEMPLATE.enable = lib.mkEnableOption "Enables TEMPLATE";

  config = lib.mkIf config.apps.TEMPLATE.enable {

  };
}
