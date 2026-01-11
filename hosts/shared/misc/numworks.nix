{
  pkgs,
  ...
}:
{
  services.udev.packages = [ pkgs.numworks-udev-rules ];
}
