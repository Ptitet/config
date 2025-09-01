{ config, lib, ... }:
let
  cfg = config.my.apps.localsend;
in
{
  options.my.apps.localsend.enable = lib.mkEnableOption "Enables Localsend";

  config = lib.mkIf cfg.enable {
    programs.localsend = {
      enable = true;
      openFirewall = true;
    };
  };
}
