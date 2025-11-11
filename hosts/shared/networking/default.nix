{ ... }:
{
  imports = [
    ./bluetooth.nix
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
