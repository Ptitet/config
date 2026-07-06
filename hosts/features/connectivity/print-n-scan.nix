{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.features.print-n-scan;
in
{
  options.features.print-n-scan.start-on-boot = lib.mkOption {
    description = "Start printing services on boot";
    default = false;
  };
  config = {
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
    systemd.services.avahi-daemon = lib.mkIf (!cfg.start-on-boot) (lib.mkForce { wantedBy = [ ]; });
  };
}
