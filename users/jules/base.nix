{
  ...
}:
{
  imports = [
    ./shared/shell
    ./shared/cli/git.nix
  ];

  age = {
    secrets = {
      anki-key = {
        file = ../../secrets/anki-key.age;
        path = "/tmp/secrets/anki-key";
      };
    };
  };

  programs = {
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    chromium = {
      enable = true;
    };
  };

  programs.home-manager.enable = true; # Let Home Manager install and manage itself
}
