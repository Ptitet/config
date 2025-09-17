{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ../../shared/apps
    ../../shared/services
  ];

  my.apps = {
    zen-browser.enable = true;
    firefox.enable = false;
    zed.enable = true;
    kitty.enable = true;
    # mega.enable = true;
  };

  my.services = {
    wpaperd.enable = true;
    waybar.enable = true;
  };

  home.packages = with pkgs; [
    obsidian
    baobab
    discord
    fastfetch
    inputs.otter-launcher.packages."x86_64-linux".default
    # crudini # for the app module of otter-launcher
  ];
}
