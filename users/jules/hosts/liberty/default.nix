{ pkgs, ... }:
{
  imports = [
    ../../shared/base.nix
  ];

  programs.btop = {
    enable = true;
    package = pkgs.btop-rocm;
  };
}
