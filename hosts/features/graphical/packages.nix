{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libnotify
    playerctl
    brightnessctl
    kitty
    nautilus
    wl-clipboard
    eog
    gimp
    libreoffice-still
    adwaita-icon-theme
    wev
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];
}
