{ config, flakeRoot, ... }: {
  programs.starship = {
    enable = true;
    enableInteractive = true;
    enableZshIntegration = true;
  };

  xdg.configFile."starship.toml".source =
    config.lib.mkOutOfStoreSymlink "${flakeRoot}/users/jules/features/shell/starship/starship.toml";
}
