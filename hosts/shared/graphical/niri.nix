{ pkgs, ... }:
{
  programs.niri.enable = true;
  services.gnome.gnome-keyring.enable = false; # Niri and ly enable it and I don't want it
  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
  xdg.portal.wlr.enable = true;
}
