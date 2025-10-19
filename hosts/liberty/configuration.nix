{
  inputs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    ../users.nix

    ../shared/networking
    ../shared/packages
    ../shared/laptop.nix
  ];

  networking.hostName = "liberty";

  system.stateVersion = "25.05"; # Don't touch that
}
