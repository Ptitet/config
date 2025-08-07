{ pkgs, ... }:
{
  imports = [
    ./bluetooth.nix
    ./vpn.nix
  ];

  networking = {
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
      appendNameservers = [
        "1.1.1.1"
        "1.0.0.1"
      ];
    };
    wireless.iwd.enable = true;
  };

  environment.systemPackages = with pkgs; [ impala ];

  networking.firewall.enable = true;
}
