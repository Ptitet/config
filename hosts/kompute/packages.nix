{ pkgs, ... }:
{
  programs = {
    steam.enable = true;
  };
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    # extraPortals = [ pkgs.xdg-desktop-portal-hyprland ]; # Enables screensharing on Hyprland.
  };

  environment.systemPackages = with pkgs; [
    usbtop
    jq
    wl-clipboard
    fd
    socat
  ];
}
