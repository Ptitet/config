{ config, flakeRoot, ... }:
let
  wallsdir = "Photos/Fonds d'écran";
in
{

  imports = [
    ./wpaperd
  ];

  home.file.${wallsdir}.source =
    config.lib.file.mkOutOfStoreSymlink "${flakeRoot}/users/jules/features/services/wallpaper/images";
}
