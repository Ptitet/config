{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.apps.anki;
in
{
  options.my.apps.anki.enable = lib.mkEnableOption "Enables Anki";

  config = lib.mkIf cfg.enable {
    programs.anki = {
      enable = true;
      language = "fr_FR";
      sync.autoSync = true;
      addons = with pkgs.ankiAddons; [
        (anki-connect.withConfig {
          config = {
            apiKey = null;
            apiLogPath = null;
            webBindAddress = "127.0.0.1";
            webBindPort = 8765;
            webCorsOrigin = "http://localhost";
            webCorsOriginList = [
              "http://localhost"
              "app://obsidian.md"
            ];
          };
        })
      ];
    };
  };
}
