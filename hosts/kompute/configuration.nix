{
  imports = [
    ./hardware-configuration.nix
    ../users.nix

    ../shared/laptop.nix
    ../shared/networking
    ../shared/packages
  ];

  networking.hostName = "kompute";
  system.stateVersion = "25.05"; # Don't touch that
}
