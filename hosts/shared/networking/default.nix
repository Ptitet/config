{ ... }:
{
  imports = [
    ./bluetooth.nix
  ];

  networking = {
    networkmanager = {
      enable = true;
      # wifi.backend = "iwd";
      appendNameservers = [
        "1.1.1.1"
        "1.0.0.1"
      ];
    };
    wireless.scanOnLowSignal = false;
    # wireless.iwd.enable = true;
  };

  # environment.systemPackages = with pkgs; [ impala ];

  networking.firewall.enable = true;
}
