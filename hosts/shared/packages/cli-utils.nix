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
    zip
    unzip
    libqalculate
  ];

  programs = {
    usbtop.enable = true;
    bat.enable = true;
  };
}
