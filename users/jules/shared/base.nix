{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./apps
    ./services
  ];

  my.apps = {
    zen-browser.enable = true;
    zed.enable = false;
    kitty.enable = true;
    anki.enable = true;
    mega.enable = false;
    otter-launcher.enable = true;
    helix.enable = true;
  };

  my.services = {
    wpaperd.enable = true;
    waybar.enable = true;
    screensaver.enable = false;
    mako.enable = true;
  };

  my.cli = {
    try = {
      enable = true;
      path = "Documents/Programmation/tries";
    };
  };

  # programs.try = {
  #   enable = true;
  #   path = "~/Documents/Programmation/tries";
  # };

  home.packages = with pkgs; [
    obsidian
    baobab
    discord
    fastfetch
    typst
    evince
    remarkable-mouse
    inputs.cli-of-life.packages."x86_64-linux".default
    inputs.keal.packages."x86_64-linux".default
    # inputs.try.packages."x86_64-linux".default
    # inputs.awww.packages."x86_64-linux".default
  ];
}
