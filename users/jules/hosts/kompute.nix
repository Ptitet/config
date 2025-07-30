{
  pkgs,
  ...
}:
{
  imports = [
    ../shared.nix
    ../apps
    ../services
  ];

  my.apps = {
    zen-browser.enable = true;
    firefox.enable = true;
    zed.enable = true;
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
