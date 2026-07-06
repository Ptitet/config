{ config, flakeRoot, ... }: {
  services.mako.enable = true;

  xdg.configFile."mako/config".source =
    config.lib.file.mkOutOfStoreSymlink "${flakeRoot}/users/jules/features/services/mako/config";
}
