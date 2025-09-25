{ config, lib, ... }:
let
  cfg = config.my.apps.anki;
in
{
  options.my.apps.anki.enable = lib.mkEnableOption "Enables Anki";

  config = lib.mkIf cfg.enable {
    programs.anki = {
      enable = true;
      language = "fr_FR";
    };
  };
}
