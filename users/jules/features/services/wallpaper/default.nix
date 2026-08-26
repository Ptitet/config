{ config, flakeRoot, ... }: {

  imports = [
    ./wpaperd
  ];

  xdg.dataFile."wallpapers".source =
    config.lib.file.mkOutOfStoreSymlink "${flakeRoot}/users/jules/features/services/wallpaper/images";
}
