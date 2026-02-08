{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.my.services.vpn-nas;
in
{
  options.my.services.nas-vpn = {
    enable = lib.mkEnableOption "Enables the VPN to connect to the nas";
  };
  config = lib.mkIf cfg.enable {

    services.openvpn.servers.nas = {
      config = "config /home/jules/vpn/nas.ovpn";
      autoStart = false;
      authUserPass = config.age.secrets.nas-vpn.path;
      up = "echo nameserver $nameserver | ${pkgs.openresolv}/sbin/resolvconf -m 0 -a $dev";
      down = "${pkgs.openresolv}/sbin/resolvconf -d $dev";
    };
    environment.systemPackages = with pkgs; [ openvpn ];
  };
}
