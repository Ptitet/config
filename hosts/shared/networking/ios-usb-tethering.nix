{
  pkgs,
  lib,
  ...
}:
{
  services.usbmuxd.enable = true;
  systemd.services.usbmuxd.wantedBy = lib.mkForce [];
  environment.systemPackages = with pkgs; [ libimobiledevice ];
}
