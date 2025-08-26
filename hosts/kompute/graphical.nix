{ pkgs, ... }:
{
  imports = [
    ../../shared/graphical
  ];

  hardware.graphics = {
    extraPackages = with pkgs; [
      intel-vaapi-driver
      mesa
    ];
  };
}
