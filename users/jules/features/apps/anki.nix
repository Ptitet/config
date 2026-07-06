{ inputs, ... }: {
  imports = [
    inputs.agenix.homeManagerModules.default
  ];

  # Maybe the path should be explicitly set
  age.secrets.anki-key.file = ../../../../secrets/anki-key;

  programs.anki = {
    enable = true;
    language = "fr_FR";
    profiles."User 1".sync = {
      autoSync = true;
      keyFile = "/run/user/1000/agenix/anki-key";
    };
  };
}
