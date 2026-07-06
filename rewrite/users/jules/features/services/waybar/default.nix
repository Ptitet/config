{ config, flakeRoot, ... }: {
  programs.waybar.enable = true;

  xdg.configFile."waybar" = {
    recursive = true;
    source = config.lib.mkOutOfStoreSymlink "${flakeRoot}/users/jules/features/services/waybar/config";
  };
}
