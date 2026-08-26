{
  inputs,
  config,
  flakeRoot,
  ...
}:
{
  imports = [
    inputs.bezel.homeManagerModules.default
  ];

  services.bezel.enable = true;

  xdg.configFile."bezel/config.toml".source = config.lib.file.mkOutOfStoreSymlink "${flakeRoot}/users/jules/features/services/bezel/config.toml";
}
