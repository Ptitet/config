{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.my.services.vicinae;
in
{
  options.my.services.vicinae.enable = lib.mkEnableOption "Enables Vicinae launcher";

  config = lib.mkIf cfg.enable {
    programs.vicinae = {
      enable = true;
      systemd = {
        enable = true;
        autoStart = true;
      };
    };
  };
}
