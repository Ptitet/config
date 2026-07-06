{ inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./disko.nix
    inputs.disko.nixosModules.disko

    # Features

    ../features/graphical/niri.nix
    ../features/graphical/pipewire.nix
    ../features/graphical/ly.nix
    ../features/graphical/packages.nix

    ../features/connectivity/tailscale.nix
    ../features/connectivity/print-n-scan.nix
    ../features/connectivity/ssh.nix

    ../features/misc/gaming.nix
  ];

  system.stateVersion = "26.05";
}
