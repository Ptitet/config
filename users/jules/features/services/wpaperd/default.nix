{ config, flakeRoot, ... }: {
  services.wpaperd.enable = true;

  xdg.configFile."wpaperd/config.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${flakeRoot}/users/jules/features/services/wpaperd/config.toml";
}
