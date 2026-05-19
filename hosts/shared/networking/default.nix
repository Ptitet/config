{
  imports = [
    ./bluetooth.nix
    ./tailscale.nix
    ./ios-usb-tethering.nix
  ];

  networking = {
    networkmanager = {
      enable = true;
      appendNameservers = [
        "1.1.1.1"
        "1.0.0.1"
      ];
    };
    wireless.scanOnLowSignal = false;
  };

  networking.firewall.enable = true;
}
