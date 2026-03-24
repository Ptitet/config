{
  config,
  ...
}:
{
  imports = [
    ./shared/shell
    ./shared/cli
  ];

  age = {
    secrets = {
      anki-key.file = ../../secrets/anki-key;
      ssh-config = {
        file = ../../secrets/ssh-config;
        name = "config";
        path = "${config.home.homeDirectory}/.ssh/config";
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
