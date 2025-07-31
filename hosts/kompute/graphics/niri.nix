{ pkgs, ... }:
{
  programs.niri.enable = true;
  services.gnome.gnome-keyring.enable = false; # Niri enables it and I don't want it
  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
}
