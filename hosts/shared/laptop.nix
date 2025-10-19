{
  imports = [
    ./misc/thermal-management.nix
    ./graphical
  ];

  services = {
    libinput.enable = true;
    logind.settings.Login.HandleLidSwitchDocked = "suspend";
  };
}
