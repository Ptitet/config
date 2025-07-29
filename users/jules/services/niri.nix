{ config, lib, ... }:
{
  options.my.services.niri.enable = lib.mkEnableOption "Enables Niri";

  config = lib.mkIf config.my.services.niri.enable {
    programs.niri.enable = true;
  };
}
