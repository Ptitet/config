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
      defaultApplications =
        let
          image = "org.gnome.eog.desktop";
          browser = "zen-twilight.desktop";
          pdf = "org.gnome.Evince.desktop";
        in
        {
          "image/png" = [ image ];
          "image/jpeg" = [ image ];
          "image/bmp" = [ image ];
          "application/pdf" = [ pdf ];
          "x-scheme-handler/https" = [ browser ];
          "x-scheme-handler/http" = [ browser ];
        };
    };
  };
}
