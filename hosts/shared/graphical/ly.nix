{
  services.displayManager.ly = {
    enable = true;
    x11Support = false; # this is enabled by default but I am on Wayland
    settings = {
      # https://codeberg.org/fairyglade/ly/src/branch/master/res/config.ini
      allow_empty_password = false;
      animation = "colormix";
      asterisk = "0x2022";
      auth_fails = 1;
      brightness_down_cmd = "/run/current-system/sw/bin/brightnessctl -n -e set 5%-";
      brightness_down_key = "F11";
      brightness_up_cmd = "/run/current-system/sw/bin/brightnessctl -e set +5%";
      brightness_up_key = "F12";
      clear_password = true;
    };
  };
}
