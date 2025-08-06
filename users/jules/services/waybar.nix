{ config, lib }:
let
  cfg = config.my.services.waybar;
in
{
  options.my.services.waybar.enable = lib.mkEnableOption "Enables Waybar";

  config = lib.mkIf cfg.enable {
    programs.waybar = {
      enable = true;
    };
  };
}
