{
  pkgs,
  ...
}:
{
  environment.systemPackages = [ pkgs.numworks-udev-rules ];
}
