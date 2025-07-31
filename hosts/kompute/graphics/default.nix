{ pkgs, ... }:
{
  imports = [
    ./ly.nix
    ./niri.nix
    ./sound.nix
  ];

  hardware.graphics = {
    extraPackages = with pkgs; [
      intel-vaapi-driver
      mesa
    ];
  };

  # Useful packages to have in a graphical environment
  environment.systemPackages = with pkgs; [
    libnotify
    playerctl
    brightnessctl
    kitty
    nautilus
  ];
}
