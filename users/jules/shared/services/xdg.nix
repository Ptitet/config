{ config, ... }:
{
  xdg = {
    configFile =
      let
        configs = builtins.attrNames (builtins.readDir ../../config);
        configPath = "${config.home.homeDirectory}/nixos/users/jules/config";
        mapFn = name: {
          inherit name;
          value.source = config.lib.file.mkOutOfStoreSymlink "${configPath}/${name}";
        };
      in
      builtins.listToAttrs (map mapFn configs);
    terminal-exec = {
      enable = true;
      settings.default = [ "kitty.desktop" ];
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "image/png" = [ "org.gnome.eog.desktop" ];
        "image/jpeg" = [ "org.gnome.eog.desktop" ];
        "application/pdf" = [ "evince.desktop" ];
        "x-scheme-handler/https" = [ "zen-twilight.desktop" ];
        "x-scheme-handler/http" = [ "zen-twilight.desktop" ];
      };
    };
  };
}
