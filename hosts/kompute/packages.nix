{ pkgs, ... }:
{
  programs = {
    # hyprland = {
    #   enable = true;
    #   withUWSM = true;
    #   xwayland.enable = true;
    # };
    niri.enable = true;
    steam.enable = true;
  };
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ]; # Enables screensharing on Hyprland.
  };

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    libnotify
    kitty
    nautilus
    usbtop
    zinit
    playerctl # control currently playing media source, such as a youtube video
    brightnessctl # adjust screen brightness
    pwvucontrol # sound control panel
    bluez-experimental
    xwayland-satellite

    uwsm # for hyprland
    jq
  ];
}
