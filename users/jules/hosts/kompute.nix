{
  pkgs,
  ...
}:
{
  imports = [
    ../apps
    ../services
  ];

  my.apps = {
    zen-browser.enable = true;
    firefox.enable = false;
    zed.enable = true;
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
    localsend
  ];
}
