{
  inputs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    ../users.nix

    ../shared/laptop.nix
    ../shared/vpn.nix
    ../shared/networking
    ../shared/packages
  ];

  networking.hostName = "kompute";
  system.stateVersion = "25.05"; # Don't touch that
}
