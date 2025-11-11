{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    jq
    fd
    socat
    killall
    wget
    btop
    fzf
    file
    ripgrep
    tree
  ];

  programs = {
    usbtop.enable = true;
    bat.enable = true;
  };
}
