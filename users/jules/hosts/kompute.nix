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
    firefox.enable = true;
    zed.enable = true;
    # steam.enable = true;
  };
  my.services = {
    # niri.enable = true;
    hyprland.enable = true;
  };

  home.packages = with pkgs; [
    obsidian
    baobab
    bun
    discord
    fastfetch
    hyprpaper
    localsend
  ];
}
