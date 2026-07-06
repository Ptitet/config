{
  pkgs,
  config,
  flakeRoot,
  ...
}:
{
  programs.helix = {
    enable = true;
    extraPackages = import ../lsps-formatters.nix pkgs;
  };

  xdg.configFile.helix = {
    recursive = true;
    source = config.lib.file.mkOutOfStoreSymlink "${flakeRoot}/users/jules/features/editors/helix/config";
  };
}
