{ pkgs, ... }:
{
  imports = [
    ./nautilus.nix
  ];

  environment.systemPackages = with pkgs; [
    libnotify
    playerctl
    brightnessctl
    kitty
    wl-clipboard
    eog
    gimp
    libreoffice-stable
    adwaita-icon-theme
    wev
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];
}
