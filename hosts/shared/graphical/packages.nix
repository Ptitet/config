{ pkgs, ... }:
{
  # Useful packages to have in a graphical environment for any user
  environment.systemPackages = with pkgs; [
    libnotify
    playerctl
    brightnessctl
    kitty
    nautilus
    wl-clipboard
    eog
    gimp
    libreoffice
    adwaita-icon-theme
  ];

  services.gvfs.enable = true;
}
