{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./shared/shell
    ./shared/cli/git.nix
    inputs.agenix.homeManagerModules.default
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

  home.packages = with pkgs; [
    typst
    evince
    inputs.cli-of-life.packages."x86_64-linux".default
  ];

  programs.home-manager.enable = true; # Let Home Manager install and manage itself
}
