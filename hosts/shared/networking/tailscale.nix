{ config, ... }:
{
  services.tailscale.enable = true;
  networking = {
    nftables.enable = true;
    firewall = {
      trustedInterfaces = [ "tailscale0" ];
      allowedUDPPorts = [ config.services.tailscale.port ];
    };
  };
  systemd = {
    services.tailscaled.serviceConfig.Environment = [ "TS_DEBUG_FIREWALL_MODE=nftables" ];
    network.wait-online.enable = false;
  };
  boot.initrd.systemd.network.wait-online.enable = false;
}
