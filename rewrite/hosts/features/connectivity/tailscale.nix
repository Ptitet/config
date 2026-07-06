{ config, lib, ... }:
let
  cfg = config.features.connectivity.tailscale;
in
{
  options.features.connectivity.tailscale.start-on-boot = lib.mkOption {
    description = "Start Tailscale on boot";
    default = false;
  };
  config = {
    services.tailscale.enable = true;
    networking = {
      nftables.enable = true;
      firewall = {
        trustedInterfaces = [ "tailscale0" ];
        allowedUDPPorts = [ config.services.tailscale.port ];
      };
    };
    systemd = {
      services.tailscaled = {
        wantedBy = lib.mkIf (!cfg.start-on-boot) (lib.mkForce [ ]);
        serviceConfig.Environment = [ "TS_DEBUG_FIREWALL_MODE=nftables" ];
      };
      network.wait-online.enable = false;
    };
    boot.initrd.systemd.network.wait-online.enable = false;
  };
}
