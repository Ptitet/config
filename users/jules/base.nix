{ config, ... }:
{
  imports = [
    ./shared/shell
    ./shared/cli/git.nix
  ];

  home.file.".config" = {
    source = config.lib.file.mkOutOfStoreSymlink ./config;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.home-manager.enable = true; # Let Home Manager install and manage itself
}
