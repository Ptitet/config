{
  config,
  lib,
  ...
}:
let
  cfg = config.features.ios-usb-tethering;
in
{
  options.features.ios-usb-tethering.start-on-boot = lib.mkOption {
    description = "Start iOS USB tethering service on boot";
    default = false;
  };
  config = {
    services.usbmuxd.enable = true;
    systemd.services.usbmuxd.wantedBy = lib.mkIf (!cfg.start-on-boot) (lib.mkForce [ ]);
  };
}
