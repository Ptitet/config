{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    usbtop
    jq
    fd
    socat
  ];
}
