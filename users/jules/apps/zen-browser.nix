{
  inputs,
  config,
  lib,
  ...
}:
{
  options.apps.zen-browser.enable = lib.mkEnableOption "Enables Zen browser";

  config = lib.mkIf config.apps.zen-browser.enable {
    home-manager.users.jules.home.packages = [
      inputs.zen-browser.packages."x86_64-linux".default
    ];
  };
}
