{ pkgs, ... }:
{
  services.openvpn.servers.nas = {
    config = "config /home/jules/vpn/nas.ovpn";
    autoStart = false;
    authUserPass = "/home/jules/vpn/auth.txt";
    up = "echo nameserver $nameserver | ${pkgs.openresolv}/sbin/resolvconf -m 0 -a $dev";
    down = "${pkgs.openresolv}/sbin/resolvconf -d $dev";
  };
  environment.systemPackages = with pkgs; [ openvpn ];
}
