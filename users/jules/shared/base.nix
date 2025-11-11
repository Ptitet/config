{
  pkgs,
  ...
}:
{
  imports = [
    ./apps
    ./services
  ];

  my.apps = {
    zen-browser.enable = true;
    zed.enable = true;
    kitty.enable = true;
    anki.enable = true;
    mega.enable = true;
    otter-launcher.enable = true;
  };

  my.services = {
    wpaperd.enable = true;
    waybar.enable = true;
    screensaver.enable = false;
  };

  home.packages = with pkgs; [
    obsidian
    baobab
    discord
    fastfetch
  ];
}
