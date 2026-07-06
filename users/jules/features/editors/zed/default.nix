{
  pkgs,
  config,
  flakeRoot,
  ...
}:
{
  programs.zed-editor = {
    enable = true;
    extraPackages = import ../lsps-formatters.nix pkgs;
    mutableUserSettings = true;
    mutableUserKeymaps = true;
    mutableUserTasks = true;
  };

  xdg.configFile.zed = {
    recursive = true;
    source = config.lib.file.mkOutOfStoreSymlink "${flakeRoot}/users/jules/features/editors/zed/config";
  };
}
