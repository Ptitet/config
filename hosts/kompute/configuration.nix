{
  inputs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    ./packages.nix
    ./users.nix
    ./graphics
    ./networking
    ../modules/thermal-management.nix
  ];

  networking.hostName = "kompute";

  services = {
    printing.enable = true; # CUPS services for printing
    libinput.enable = true; # Enable touchpad support (enabled default in most desktopManager).
    gvfs.enable = true; # Needed for Nautilus
    logind.lidSwitchDocked = "suspend";
  };

  system.stateVersion = "25.05"; # Don't touch that
}
