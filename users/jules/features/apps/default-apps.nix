{
  xdg = {
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
          "image/heic" = [ image ];
          "application/pdf" = [ pdf ];
          "x-scheme-handler/http" = [ browser ];
          "x-scheme-handler/https" = [ browser ];
        };
    };
  };
}
