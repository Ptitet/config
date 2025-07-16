{ config, lib, ... }:
{
  options.apps.steam.enable = lib.mkEnableOption "Enables Steam";

  config = lib.mkIf config.apps.steam.enable {
    programs.steam.enable = true;
  };
}
