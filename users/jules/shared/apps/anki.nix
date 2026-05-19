{
  config,
  lib,
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
      profiles."User 1" = {
        sync = {
          autoSync = true;
          keyFile = "/run/user/1000/agenix/anki-key"; # Path hardcoded because the anki module cannot expand env vars
        };
      };
    };
  };
}
