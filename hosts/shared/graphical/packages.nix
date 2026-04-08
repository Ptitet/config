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
    # libreoffice-still
    adwaita-icon-theme
    wev
  ];

  services.gvfs.enable = true;
}
