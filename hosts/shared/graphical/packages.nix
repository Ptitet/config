{ pkgs, ... }:
{
  # Useful packages to have in a graphical environment for any user
  # Everyone should have
  environment.systemPackages = with pkgs; [
    libnotify
    playerctl
    brightnessctl
    kitty
    nautilus
    wl-clipboard
  ];
}
