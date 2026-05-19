{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.my.print-n-scan;
in
{
  options.my.print-n-scan.enable = lib.mkEnableOption "Enables CUPS and SANE";
  config = lib.mkIf cfg.enable {
    hardware = {
      sane.enable = true;
      sane.extraBackends = [ pkgs.sane-airscan ];
    };
    services = {
      avahi = {
        enable = true;
        nssmdns4 = true;
      };
      udev.packages = [ pkgs.sane-airscan ];
    };
  };
}
