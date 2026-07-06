{
  imports = [
    ./hardware-configuration.nix

    # Features

    ../features/graphical/pipewire.nix
    ../features/graphical/ly.nix
    ../features/graphical/niri.nix
    ../features/graphical/packages.nix

    ../features/connectivity/bluetooth.nix
    ../features/connectivity/tailscale.nix
    ../features/connectivity/ios-usb-tethering.nix
    ../features/connectivity/print-n-scan.nix
    ../features/connectivity/ssh.nix

    ../features/misc/numworks.nix
    ../features/misc/minegrub.nix

    ../features/howdy.nix
  ];

  features.minegrub.splash = "Spent too much time on this!";

  system.stateVersion = "25.05"; # Don't touch that
}
