{
  imports = [
    ../../features/apps/anki.nix
    ../../features/apps/kitty.nix
    ../../features/apps/default-apps.nix
    ../../features/apps/environment.nix
    ../../features/browsers/zen.nix
    ../../features/browsers/chromium.nix
    ../../features/cli/try.nix
    ../../features/services/launchers/vicinae
    ../../features/services/waybar
    ../../features/services/wpaperd
    ../../features/services/mako
    ../../features/services/niri
  ];

  home.stateVersion = "25.05";
}
