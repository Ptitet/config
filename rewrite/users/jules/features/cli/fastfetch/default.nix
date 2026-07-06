{
  pkgs,
  config,
  flakeRoot,
  ...
}:
{
  home.packages = [ pkgs.fastfetch ];

  xdg.configFile."fastfetch/config.jsonc".source =
    config.lib.mkOutOfStoreSymlink "${flakeRoot}/users/jules/features/cli/fastfetch/config.jsonc";
}
