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
    ../shared/graphical
    ../shared/thermal-management.nix
  ];

  networking.hostName = "liberty";

  services = {
    printing.enable = true; # CUPS services for printing
    libinput.enable = true; # Enable touchpad support (enabled default in most desktopManager).
    gvfs.enable = true; # Needed for Nautilus
    logind.settings.Login.HandleLidSwitchDocked = "suspend";
  };

  system.stateVersion = "25.05"; # Don't touch that
}
