{ config, flakeRoot, ... }: {
  programs.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;
    };
  };

  xdg.configFile."vicinae/settings.json".source =
    config.lib.file.mkOutOfStoreSymlink "${flakeRoot}/users/jules/features/services/launchers/vicinae/settings.json";
}
